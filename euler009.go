package main

import (
	"fmt"
	"log"
)

func main() {
	for _, n := range input() {
		fmt.Println(getResult(n))
	}
}

func getResult(sum int) int {
	max := -1
	if sum%2 == 0 {
		for b := 3; b < sum/2; b++ {
			if sum*(sum/2-b)%(sum-b) == 0 {
				a := sum * (sum/2 - b) / (sum - b)
				c := sum - a - b
				product := a * b * c
				if product > max {
					max = product
				}
			}
		}
	}
	return max
}

func input() (ints []int) {
	var T int

	_, err := fmt.Scanln(&T)
	if err != nil {
		log.Panic(err)
	}

	var n int

	for l := T; l > 0; l-- {
		_, err = fmt.Scanln(&n)
		if err != nil {
			log.Panic(err)
		}

		ints = append(ints, n)
	}

	return
}
