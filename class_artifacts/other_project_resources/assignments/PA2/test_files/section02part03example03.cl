class List inherits A2I {
    item: Object;
    next: List;

    init(i: String, n: List): List {
        {
            item <- i;
            next <- n;
            self;
        }
    };

    flatten(): String {
        let string: String <-
            case item of
                i: Int => i2a(1);
                s: String => s;
                o: Object => { abort(); ""; };
            esac
        in
            if (isvoid next) then
                string
            else
                string.concat(next.flatten())
            fi
    };
};

class Main inherits IO {
    main(): Object {
        let hello: String <- "Hello ",
            world: String <- "World!",
            newline: String <- "\n",
            nil: List,
            list: List <- (new List).init(hello,
                            (new List).init(world,
                              (new List).init(newline, nil)))
        in
            out_string(hello.concat(world.concat(newline)))
    };
};