(* Q4 : basic type checking *)

type binOp = OpPlus | OpTimes

type unOp = OpIsZero

type myType = T_Int | T_Bool | T_Fun of myType * myType

type expr = Int of int
          | Bool of bool
          | If of expr * expr * expr
          | BinOp of binOp * expr * expr 
          | UnOp of unOp * expr 
          | Var of string
          | Fun of (string * myType) * expr
          | App of expr * expr

exception Fail of string




