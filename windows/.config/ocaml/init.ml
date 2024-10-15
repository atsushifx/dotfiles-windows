(* @(#) ocaml init file *)
(*
 * @version	1.0.1
 * @author	Furukawa, Atsushi <atsushifx@aglabo.com>
 * @date	2023-03-01
 * @license	 MIT
 *
 * @desc<<
 *
 *<<
 *)

print_string "init ocaml from initl.ml\n";;

let print_non_escaped_string ppf = Format.fprintf ppf "\"%s\"";;
#install_printer print_non_escaped_string;;
