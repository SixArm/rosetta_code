package main
import "os"
import "fmt"

func main() {
    var s = os.Getenv("EXAMPLE")
    fmt.Println(s)
}
