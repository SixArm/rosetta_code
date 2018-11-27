# Go

Install and run:

    go install src/task.go 
    bin/task

If you get errors about the path, then you can set the path temporarily like this:

    GOPATH="$(pwd)" GOBIN="$(pwd)/bin" go install src/task.go
    bin/task
