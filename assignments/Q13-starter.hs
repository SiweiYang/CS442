-- CS 442 Q13 starter file

data BinOp = Plus | Times | Sub | Div | Cons deriving (Eq,Show)
data UnOp = IsEmpty | IsZero | Fst | Rst deriving (Eq,Show)

data Ast = NumLit Integer
         | BoolLit Bool 
         | EmptyLit
         | UnApp UnOp Ast 
         | BinApp BinOp Ast Ast
         | If Ast Ast Ast
         | Fun String Ast
         | Var String 
         | App Ast Ast
         | Let String Ast Ast
         | Letrec String Ast Ast
         deriving (Eq,Show)

data List = Empty | Kons Val List deriving (Eq,Show)

data Val = Number Integer | Truthy Bool | Lst List
           | Closure String Ast Env deriving (Eq,Show)

type Env = [(String, Val)]

-- Complete the definition of interp

interp ::  Ast -> Env -> Val
