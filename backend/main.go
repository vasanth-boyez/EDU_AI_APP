package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/go-sql-driver/mysql"
	"github.com/labstack/echo/v4"
	"github.com/rs/cors"
)

var db *sql.DB

type Login struct {
	Username string `json: "UserName"`
	Password string `json : "password"`
}

type profile struct {
	Name    string `json: "name"`
	Email   string `json : "email"`
	Address string `json: "address"`
	Phone   string `json : "phone"`
}

func connectDB() *sql.DB {
	// Capture connection properties.
	cfg := mysql.Config{
		User:                 "root",
		Passwd:               "root",
		Net:                  "tcp",
		Addr:                 "localhost:3306",
		DBName:               "eduai",
		AllowNativePasswords: true,
	}
	// Get a database handle.
	var err error
	db, err = sql.Open("mysql", cfg.FormatDSN())
	if err != nil {
		log.Fatal(err)
	}

	pingErr := db.Ping()
	if pingErr != nil {
		log.Fatal(pingErr)
	}
	fmt.Println("Connected!")
	// Now you can execute SQL queries using the 'db' object
	return db
}

func main() {

	e := echo.New()
	db := connectDB()

	e.Use(echo.WrapMiddleware(cors.Default().Handler))
	e.GET("/", func(c echo.Context) error {

		return c.String(http.StatusOK, "Hello, World!")
	})

	e.POST("/send-data", func(c echo.Context) error {
		var data map[string]string
		fmt.Println("Hello")

		if err := c.Bind(&data); err != nil {
			return err
		}
		rows, err := db.Query("SELECT username, password FROM user WHERE username = ? AND password = ?", data["username"], data["password"])
		if err != nil {
			panic(err.Error())
		}
		defer rows.Close()

		// Process the query results
		rowCount := 0

		for rows.Next() {
			var username string
			var password string
			if err := rows.Scan(&username, &password); err != nil {
				panic(err.Error())
			}
			rowCount++
			fmt.Printf("%s  %s\n", username, password)
			print("Login Successful :)")

		}

		if rowCount == 0 {
			return c.String(http.StatusNotFound, "user not found")
		}

		return c.String(http.StatusOK, "Data Sent Successfully")
	})

	e.POST("/profile", func(c echo.Context) error {
		db := connectDB()
		var data profile
		if err := c.Bind(&data); err != nil {
			return err
		}
		fmt.Println(data)

		_, _ = db.Exec("INSERT INTO profile (name,email,address,phone_no) VALUES (?, ?, ?, ?)",
			data.Name, data.Email, data.Address, data.Phone)

		return c.String(http.StatusOK, "Data inserted successfully")
	})

	e.POST("/send", func(c echo.Context) error {
		var data map[string]string
		fmt.Println("Hello")

		if err := c.Bind(&data); err != nil {
			return err
		}
		rows, err := db.Query("SELECT name, email, address, phone_no FROM user WHERE name = ?,email = ?, address = ? AND phone_no = ?", data["name"], data["email"], data["address"], data["phone_no"])
		if err != nil {
			panic(err.Error())
		}
		defer rows.Close()

		// Process the query results
		rowCount := 0

		for rows.Next() {
			var name string
			var email string
			if err := rows.Scan(&name, &email); err != nil {
				panic(err.Error())
			}
			rowCount++
			fmt.Printf("%s  %s\n", name, email)
			print("profile sucess :)")

		}

		if rowCount == 0 {
			return c.String(http.StatusNotFound, "user not found")
		}

		return c.String(http.StatusOK, "Data Sent Successfully")
	})

	e.POST("/Createaccount", func(c echo.Context) error {
		db := connectDB()
		var data Login
		if err := c.Bind(&data); err != nil {
			return err
		}
		fmt.Println(data)

		_, _ = db.Exec("INSERT INTO user (username,password) VALUES (?, ?)",
			data.Username, data.Password)

		return c.String(http.StatusOK, "Data inserted successfully")
	})

	e.Logger.Fatal(e.Start(":8080"))
}
