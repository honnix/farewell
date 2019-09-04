package main

import  (
	"io/ioutil"
	"os"
	"regexp"
	"strings"
	"strconv"
	"fmt"
)

func main() {
	re, _ := regexp.Compile("[\n\r\t ]")
	contents, _ := ioutil.ReadFile(os.Args[1])
	encrypted := strings.Split(re.ReplaceAllString(string(contents), ""), ",")

	const Key = "i hope in the next ten years there would be no other farewell letter brilliant than this one"

	var decrypted []uint8
	for i, v := range encrypted {
		tmp, _ := strconv.Atoi(v)
		decrypted = append(decrypted, uint8(tmp ^ int(Key[i % len(Key)])))
	}

	fmt.Print(string(decrypted))
}
