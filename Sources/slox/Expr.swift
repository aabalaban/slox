//
//  Created by Alexander Balaban.
//

protocol ExprVisitor {
    associatedtype ER
    
    func visit(_ expr: AssignExpr) throws -> ER
    func visit(_ expr: BinaryExpr) throws -> ER
    func visit(_ expr: CallExpr) throws -> ER
    func visit(_ expr: GetExpr) throws -> ER
    func visit(_ expr: GroupingExpr) throws -> ER
    func visit(_ expr: LiteralExpr) throws -> ER
    func visit(_ expr: LogicalExpr) throws -> ER
    func visit(_ expr: SetExpr) throws -> ER
    func visit(_ expr: SuperExpr) throws -> ER
    func visit(_ expr: ThisExpr) throws -> ER
    func visit(_ expr: UnaryExpr) throws -> ER
    func visit(_ expr: VariableExpr) throws -> ER
}

protocol Expr: CustomStringConvertible {
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER
}

final class AssignExpr: Expr {
    let name: Token
    let value: Expr
    var description: String { "<\(name):\(value)>" }
    
    init(name: Token, value: Expr) {
        self.name = name
        self.value = value
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class BinaryExpr: Expr {
    let left: Expr
    let op: Token
    let right: Expr
    var description: String { "<\(Self.self):\(left),\(op),\(op)>" }
    
    init(left: Expr, op: Token, right: Expr) {
        self.left = left
        self.op = op
        self.right = right
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class CallExpr: Expr {
    let calee: Expr
    let paren: Token
    let args: [Expr]
    var description: String { "\(Self.self):<\(calee),\(paren),\(args)>" }
    
    init(calee: Expr, paren: Token, args: [Expr]) {
        self.calee = calee
        self.paren = paren
        self.args = args
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class GetExpr: Expr {
    let name: Token
    let object: Expr
    var description: String { "\(Self.self):<\(name),\(object)>" }
    
    init(name: Token, object: Expr) {
        self.name = name
        self.object = object
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class GroupingExpr: Expr {
    let expr: Expr
    var description: String { "<\(Self.self):\(expr)>" }
    
    init(expr: Expr) {
        self.expr = expr
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class LiteralExpr: Expr {
    let object: LoxObject
    var description: String { "<\(Self.self):\(object)>" }
    
    init(object: LoxObject) {
        self.object = object
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class LogicalExpr: Expr {
    let left: Expr
    let op: Token
    let right: Expr
    var description: String { "<\(Self.self):\(left),\(op),\(op)>" }
    
    init(left: Expr,
         op: Token,
         right: Expr) {
        self.left = left
        self.op = op
        self.right = right
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class SetExpr: Expr {
    let name: Token
    let object: Expr
    let value: Expr
    var description: String { "\(Self.self):<\(name),\(object),\(value)>" }
    
    init(name: Token, object: Expr, value: Expr) {
        self.name = name
        self.object = object
        self.value = value
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class SuperExpr: Expr {
    let keyword: Token
    let method: Token
    var description: String { "\(Self.self):<\(keyword)>,\(method)" }
    
    init(keyword: Token, method: Token) {
        self.keyword = keyword
        self.method = method
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class ThisExpr: Expr {
    let keyword: Token
    var description: String { "\(Self.self):<\(keyword)>" }
    
    init(keyword: Token) {
        self.keyword = keyword
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class UnaryExpr: Expr {
    let op: Token
    let right: Expr
    var description: String { "<\(Self.self):\(op),\(op)>" }
    
    init(op: Token, right: Expr) {
        self.op = op
        self.right = right
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}

final class VariableExpr: Expr {
    let name: Token
    var description: String { "<\(Self.self):\(name)>" }
    
    init(name: Token) {
        self.name = name
    }
    
    func accept<Visitor: ExprVisitor>(visitor: Visitor) throws -> Visitor.ER {
        return try visitor.visit(self)
    }
}
