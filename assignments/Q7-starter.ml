(* Q7 : basic type inference *)

type myType = T_Int | T_Bool | T_Fun of myType * myType | T_Var of int

type expr = Int of int
          | Bool of bool
          | Var of string
          | Fun of string * expr
          | App of expr * expr

type subst = (int * myType) list

exception Fail of string

let count = ref 0

(* permitted mutation *)

let freshTVar() = T_Var (count := !count+1; !count)

let resetTVar() = count := 0

(* end of permitted mutation *)

