// Sophia Thi
// Assignment 2
// CPSC 5330

// Use my Amazon orders to find my past book orders
// It's weird using an array of tuples compared to using a dataframe
let books: [(title: String, pages: Int)] = [
    ("Advanced Analytics with Spark: patterns for Learning from Data at Scale", 280),
    ("High Performance Spark: Best Practices for Scaling and Optimizing Apache Spark", 358),
    ("Programming Scala: Scalability = Functional Programming + Objects", 422),
    ("Scala Cookbook: Recipes for Object-Oriented and Functional Programming", 720),
    ("Elasticsearch in Action", 496),
    ("A Tour of C++ (C++ In-Depth Series", 81),
    ("Fundamentals of Machin Learning for Predictive Data Analtyics: Algorithms, Worked Examples, and Case Studies", 624),
    ("Mathematics of Machine Learning: Master Linear Algebra, Calculus, and probability for Machine Learning", 730),
    ("Mathematics for Machine Learning", 398),
    ("AI Engineering: Building Applications with Foundation Models", 32),
    ("Designing Machine Learning Systems", 386),
    ("Hands-On Machine Learning with SciKit-Learn and PyTorch", 875),
    ("Deep Learning with Python", 648),
    ("Deep Reinforcement Learning Hands-On", 716),
    ("Graph Machine Learning", 434),
    ("Knowledge Graphs and LLMs in Action", 472)
]

// func name(param: Type) -> Return because this is... different than what languages I use on a day to day basis
// Post: research says yes camelCase for functions, variables, but Types (struct/class) are PascalCase so like Java

// All of the functions
func averagePages(in books: [(title: String, pages: Int)]) -> (average: Double, count: Int) {
    let totalPages = books.reduce(0) { $0 + $1.pages}
    let average = Double(totalPages) / Double(books.count)
    return (average: average, count: books.count)
}

// Did min/max functions because why not. I have to learn somewhere and I like having emotional support code
//returns the book with the mini # page
func minPages(in books: [(title: String, pages: Int)]) -> (title: String, pages: Int) {
    let minBook = books.min {$0.pages < $1.pages}!
    return (title: minBook.title, pages: minBook.pages)
}
// returns the book with the max # page
func maxPages(in books: [(title: String, pages: Int)]) -> (title: String, pages: Int) {
    let maxBook = books.max {$0.pages < $1.pages}!
    return (title: maxBook.title, pages: maxBook.pages)
}

// filter by pages greater than 350
func filterPages(from books: [(title: String, pages: Int)]) -> [(title: String, pages: Int)] {
    books.filter {$0.pages >= 350}
}

// Print all of the details to Console Output
// I guess I could have put it in the functions but I like having it output all in one place

// Average pages stats
let avgStats = averagePages(in: books)
print("These are the average # of pages \(avgStats.count) books:")
print(avgStats.average)

// Min pages book stats
let minBook = minPages(in: books)
print("\nThis is the book with the least # of pages:")
print("\(minBook.title) - \(minBook.pages) pages")

// Max pages book stats
let maxBook = maxPages(in: books)
print("\nThis is the book with the most # of pages:")
print("\(maxBook.title) - \(maxBook.pages) pages")

// filter the array of tuples stats
let filteredBook = filterPages(from: books)
print("\nBooks with 350 pages or more:")
for book in filteredBook {
    print("\(book.title) - \(book.pages) pages.")
}
