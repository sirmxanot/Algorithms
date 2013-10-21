trait Expression {
  // accessors
  def numValue: Int
  def leftOperand: Expression
  def rightOperand: Expression

  // methods
  def evaluate: Int = this match {
    case Number(n) => n
    case Sum(e1, e2) => e1.evaluate + e2.evaluate
    case Variable(name) => name.show
    case Product(e1, e2) => e1.evaluate * e2.evaluate
  }

  def show: String = this match {
    case Number(n) => n.toString
    case Sum(e1, e2) => e1.show + " + " + e2.show
    case Variable(name) => name
    case Product(e1, e2) => e1.show + " * " + e2.show
  }
}

class Number(n: Int) extends Expression {
  // accessors
  def numValue: Int = n
  def leftOperand: Expression = throw new Error("Number has no leftOperand")
  def rightOperand: Expression = throw new Error("Number has no rightOperand")
  def name: String = throw new Error("Number has no name")
}

class Sum(e1: Expression, e2: Expression) extends Expression {
  // accessors
  def numValue: Int = throw new Error("Sum has no numValue")
  def leftOperand: Expression = e1
  def rightOperand: Expression = e2
  def name: String = throw new Error("Sum has no name")
}

class Variable(name: String) extends Expression {
  //accessors
  def numValue: Int = throw new Error("Variable has no numValue")
  def leftOperand: Expression = throw new Error("Variable has no leftOperand")
  def rightOperand: Expression = throw new Error("Variable has no rightOperand")
  def name: String = name
}

class Product(e1: Expression, e2: Expression) extends Expression {
  // accessors
  def numValue: Int = throw new Error("Product has no numValue")
  def leftOperand: Expression = e1
  def rightOperand: Expression = e2
  def name: String = throw new Error("Product has no name")
}