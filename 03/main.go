package main

import (
	"os"
	"strings"
	"unicode"
)

func main() {
	//First()
	Second()
}

func First() {
	lowercase := "abcdefghijklmnopqrstuvwxyz"
	uppercase := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

	bytes, _ := os.ReadFile("3.txt")
	content := string(bytes)
	lines := strings.Split(content, "\n")
	total := 0

	for _, line := range lines {
		firstCompartment := line[0 : len(line)/2]
		secondCompartment := line[len(line)/2:]

		firstLineLower,firstLineUpper := SeperateCapitilizedLetters(firstCompartment)

		for _, char := range firstLineUpper {

			if strings.Contains(secondCompartment, string(char)) {
				total += strings.Index(uppercase, string(char)) + 27
				break
			}
		}

		for _, char := range firstLineLower {

			if strings.Contains(secondCompartment, string(char)) {
				total += strings.Index(lowercase, string(char)) + 1
				break
			}
		}
	}
	println(total)
}

func Second() {
	lowercase := "abcdefghijklmnopqrstuvwxyz"
	uppercase := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

	bytes, _ := os.ReadFile("3.txt")
	lines := strings.Split(string(bytes), "\n")
	total := 0

	for i := 0; i < len(lines)/3; i++ {
		firstLine := lines[i*3]
		secondLine := lines[i*3+1]
		thirdLine := lines[i*3+2]

		firstLineLower,firstLineUpper := SeperateCapitilizedLetters(firstLine)

		for _, char := range firstLineUpper {
			if strings.Contains(secondLine, string(char)) && strings.Contains(thirdLine, string(char)) {
				total += strings.Index(uppercase, string(char)) + 27
				break
			}
		}

		for _, char := range firstLineLower {
			if strings.Contains(secondLine, string(char)) && strings.Contains(thirdLine, string(char)) {
				total += strings.Index(lowercase, string(char)) + 1
				break
			}
		}
	}
	println(total)
}

func SeperateCapitilizedLetters(line string) (lower string, upper string) {
	for _, char := range line {
		if unicode.IsLower(char) {
			lower += string(char)
		} else {
			upper += string(char)
		}
	}
	return
}
