package main

import (
	fmt "fmt"
)

func main() {
	var a, b, c int
	var (
		str string
	)
	fmt.Scanf("%d", &a)
	fmt.Scanf("%d %d", &b, &c)
	fmt.Scanf("%s", &str)
	fmt.Printf("%d %s\n", a+b+c, str)
}
