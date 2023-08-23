;; open Assert
;; open Dna
;; open Helices

(* The assertion library by default will run _all_ of the test cases associated
 * with this program.  However, while debugging you may prefer to have the
 * testing stop on the first failure that is encountered. Comment the line
 * below to turn off first-failure. *)
;; stop_on_failure ()


(******************************************************************************)
(********************** REMEMBER TO WRITE TESTS FIRST! ************************)
(********************* WRITE ALL TESTS BELOW THIS POINT ***********************)
(******************************************************************************)

(* If you'd like to test your helper functions, you should do that in dna.ml.
 * The only way you can test them in this file is by declaring them in
 * dna.mli - however if you do so your code won't compile with the grading
 * server because you don't submit your own dna.mli!
 *
 * If you'd like to write trees to use in your tests, put them in this file.
 * When writing trees of depth greater than 1 for tests, please indent all 
 * children by 4 spaces, separate children by line breaks, and place parentheses
 * similar to the following tree:
 *
 * LNode (
 *     LNode (
 *         LLeaf h1,
 *         h2,
 *         LLeaf h3
 *     ),
 *     h4,
 *     LLeaf h5
 * )
 *
*)

(************************ complementary_helix tests ***************************)

(* Here's an example test case.  Be sure to fill in the incomplete test cases
 * we provided. *)
let test () : bool =
  complementary_helix [] = []
;; run_test "complementary_helix empty list" test

let test () : bool =
  complementary_helix [T] = [A]
;; run_test "complementary_helix singleton" test

let test () : bool =
  complementary_helix [C; T; T; C] = [G; A; A; G]
;; run_test "complementary_helix multi-element list" test

let test () : bool =
  complementary_helix [C; T; A; A; T; G; T] = [G; A; T; T; A; C; A]
;; run_test "complementary_helix multi-element list with all nucleotides" test



(*************************** hamming_distance tests ***************************)

(* Here's an example test case.  Be sure to add your own--we will be grading the
 * tests for this problem. *)

let test () : bool =
  hamming_distance [G; A] [G; T] = 1
;; run_test "hamming_distance one different nucleotide" test

let test () : bool =
  hamming_distance [] [] = 0
;; run_test "hamming_distance empty lists" test

let test () : bool =
  hamming_distance [G] [T] = 1
;; run_test "hamming_distance singleton list" test

let test () : bool =
  hamming_distance [G; C; A; T; A; C] [G; T; A; A; T; C] = 3
;; run_test "hamming_distance multiple different nucleotides" test

(************************ decreasing_similarity tests *************************)

(* Be sure to add your own test cases -- we will be grading the tests for this 
 * problem. *)

let test () : bool = 
  decreasing_similarity []
;; run_test "decreasing_similarity empty list" test

let test () : bool = 
  decreasing_similarity [chimpanzee]
;; run_test "decreasing_similarity singleton list" test

let test () : bool = 
  not (decreasing_similarity [siamang; chimpanzee; orangutan])
;; run_test "decreasing_similarity fail short list" test

let test () : bool = 
  decreasing_similarity [pileated_gibbon; white_cheeked_gibbon; lar_gibbon]
;; run_test "decreasing_similarity long list" test

(**************************** acids_of_helix tests ****************************)

(* Here's an example test case.  Be sure to add your own--we will be grading the
 * tests for this problem.  Also be sure to fill in the incomplete test case
 * we provided. *)

let test () : bool =
  acids_of_helix [A; G; T; A; C] = [Met]
;; run_test "acids_of_helix single codon" test

let test () : bool =
  acids_of_helix [A; G; T; A; C; T; A; C; T; C; C] = [Met; Met; Arg]
;; run_test "acids_of_helix multiple Mets at start" test

let test () : bool =
  acids_of_helix [] = []
;; run_test "acids_of_helix empty list" test

let test () : bool =
  acids_of_helix [A] = []
;; run_test "acids_of_helix singleton" test

(************ Kudos problem: all_acids_of_helix tests *************************)

(* These tests are commented out because they are for the kudos problem.
 * If you attempt this problem, remember to uncomment the tests. And write
 * some of your own! *)

(*
let test () : bool =
  all_acids_of_helix [T; A; C; A; C; T] = [[Met]]
;; run_test "all_acids_of_helix  [T; A; C; A; C; T]" test

let test () : bool =
  all_acids_of_helix [T; A; C; A; C; T; T; A; C; A; C; T] = [[Met]; [Met]]
;; run_test "all_acids_of_helix [T; A; C; A; C; T; T; A; C; A; C; T]" test

let test () : bool =
  all_acids_of_helix [T; A; C; A; C; T; G; A; T; A; C; A; C; T] = [[Met]; [Met]]
;; run_test "all_acids_of_helix [T; A; C; A; C; T; G; A; T; A; C; A; C; T]" test
*)


(***************************** count_leaves tests *****************************)

(* Here are two example tests cases. Both trees should contain exactly four
 * species. Don't forget to add your own test cases! *)

let test () : bool =
  count_leaves (greater_apes ()) = 4
;; run_test "count_leaves greater_apes" test

let test () : bool =
  count_leaves (lesser_apes ()) = 4
;; run_test "count_leaves lesser_apes" test

let test () : bool =
  count_leaves (Leaf orangutan) = 1
;; run_test "count_leaves 1 leaf" test

let bigger () : tree = 
   Node ( 
    Node (
      Node (
        Leaf orangutan,
        Leaf gorilla
      ),
      Leaf orangutan
    ),
    Node (
      Leaf gorilla,
      Leaf orangutan
    ) 
  )

let test () : bool =
  count_leaves (bigger ()) = 5
;; run_test "count_leaves bigger" test

(**************************** helix_of_tree tests *****************************)

(* Here's an example test case.  Be sure to add your own--we will be grading the
 * tests for this problem. *)

let test () : bool =
  helix_of_tree (LNode (LLeaf [T], [A], LLeaf [G])) = [A]
;; run_test "helix_of_tree lnode" test

let test () : bool =
  helix_of_tree (LLeaf [G]) = [G]
;; run_test "helix_of_tree one leaf" test

let test () : bool =
  helix_of_tree (LNode (
                  LNode (
                    LLeaf [T], 
                    [A], 
                    LLeaf [G]
                  ), 
                  [A], 
                  LNode (
                    LLeaf [T], 
                    [A], 
                    LLeaf [G]
                  )
                )) = [A]
;; run_test "helix_of_tree big tree" test

(**************************** unlabel_tree tests ******************************)

(* Here's an example test case.  Be sure to add your own--we will be grading the
 * tests for this problem. *)

let test () : bool =
  unlabel_tree (LNode (LLeaf [T], [A], LLeaf [G])) =
  Node (Leaf [T], Leaf [G])
;; run_test "unlabel_tree depth-2 tree" test

let test () : bool =
  unlabel_tree (LLeaf [T]) = Leaf [T]
;; run_test "unlabel_tree depth-1 tree" test

let test () : bool =
  unlabel_tree (LNode (
                  LNode (
                    LLeaf [T], 
                    [A], 
                    LLeaf [G]
                  ), 
                  [A], 
                  LNode (
                    LLeaf [T], 
                    [A], 
                    LLeaf [G]
                  )
                )) = Node (
                      Node (
                        Leaf [T], 
                        Leaf [G]
                      ),  
                      Node (
                        Leaf [T], 
                        Leaf [G]
                      )
                    )
;; run_test "unlabel_tree big tree" test

(************************* guess_parent_helix tests ***************************)

(* Here's an example test case.  Be sure to fill in the incomplete test case
 * we provided *)

let test () : bool =
  guess_parent_helix [T; C; A] [G; C; A] = [A; C; A]
;; run_test "guess_parent_helix one difference" test

let test () : bool =
  guess_parent_helix [A; C; G; G; T; A; C]
    [C; T; G; C; T; A; A] = [A; A; G; A; T; A; A]
;; run_test "guess_parent_helix multiple differences" test

(************************ add_ancestor_labels tests ***************************)

(* Here's an example test case.  Be sure to fill in the incomplete test cases
 * we provided and don't forget to add your own test cases! *)

let test () : bool =
  add_ancestor_labels (Node (Leaf [T], Leaf [G])) =
  LNode (LLeaf [T], [A], LLeaf [G])
;; run_test "add_ancestor_labels depth-2 tree" test

let test () : bool =
  add_ancestor_labels (Node (Leaf [T; C], Leaf [T; C])) = LNode (LLeaf [T; C], 
  [T; C], LLeaf [T; C])
;; run_test "add_ancestor_labels also depth-2 tree" test

let test () : bool =
  add_ancestor_labels (Leaf [T; C]) = LLeaf [T; C]
;; run_test "add_ancestor_labels 1 leaf" test

let test () : bool =
  add_ancestor_labels (Node (
                        Node (
                          Leaf [T; C], 
                          Leaf [T; C]
                        ), 
                        Leaf [T; C])
                      ) = 
  LNode (
    LNode (
      LLeaf [T; C], 
      [T; C],
      LLeaf [T; C]
    ), 
    [T; C],
    LLeaf [T; C]
  )
;; run_test "add_ancestor_labels depth-3 tree" test

let test () : bool =
  add_ancestor_labels (Node (Leaf [T; C; T], Leaf [T; C; G])) = 
  LNode (LLeaf [T; C; T], [T; C; A], LLeaf [T; C; G])
;; run_test "add_ancestor_labels another depth-2 tree" test

let test () : bool =
  add_ancestor_labels (Node (
                        Node (
                          Leaf [T; G; C; A], 
                          Leaf [T; C; C; A]
                        ), 
                        Leaf [T; C; G; C])
                      ) = 
  LNode (
    LNode (
      LLeaf [T; G; C; A], 
      [T; A; C; A],
      LLeaf [T; C; C; A]
    ), 
    [T; A; A; A],
    LLeaf [T; C; G; C]
  )
;; run_test "add_ancestor_labels another depth-3 tree" test


(************************ parent_child_hamming tests **************************)

(* Here we give you one example test.  Add your own tests--we will grade the
 * test cases for this problem.  Be sure to test for trees of greater depth. *)

let test () : bool =
  parent_child_hamming (LNode (LLeaf [T], [A], LLeaf [G])) = 2
;; run_test "parent_child_hamming depth-2 tree, all different" test

let test () : bool =
  parent_child_hamming (LLeaf [T]) = 0
;; run_test "parent_child_hamming 1 leaf" test

let test () : bool =
  parent_child_hamming (LNode (LLeaf [A; C], [A; C], LLeaf [G; C])) = 1
;; run_test "parent_child_hamming depth-2 tree, one different" test

let test () : bool =
  parent_child_hamming (LNode (
                          LNode (
                            LLeaf [A; C; G; T], 
                            [A; C; C; C], 
                            LLeaf [G; C; A; T]
                            ),
                            [A; C; C; C], 
                            LLeaf [G; C; A; T]
                          )
                        ) = 8
;; run_test "parent_child_hamming also depth-2 tree, multiple different" test

(**************************** simplest_tree tests *****************************)

(* Here are two example test cases. Don't forget to add your own test cases!
 *
 * Note: If you want to write a test that fails on purpose, then you can use
 * run_failing_test. run_failing_test will fail if the function returns true or 
 * false, and will pass if the function throws an error *)

let test () : bool =
  simplest_tree [] = (LLeaf [], 0)
;; run_failing_test "simplest_tree empty" test

let test () : bool =
  let t1 = LNode (LLeaf [A], [T], LLeaf [C]) in
  let t2 = LNode (
               LLeaf [G; T],
               [A; T],
               LNode (
                   LLeaf [T; T], 
                   [T; T], 
                   LLeaf [C; G]
               )
           ) in
  simplest_tree [t1; t2] = (t1, 2)
;; run_test "simplest_tree two tree list" test

let test () : bool =
  let t1 = LNode (
               LLeaf [G; T; A],
               [A; T; A],
               LNode (
                   LLeaf [T; T; C], 
                   [T; T; C], 
                   LLeaf [C; G; G]
               )
           ) in
  simplest_tree [t1] = (t1, 6)
;; run_test "simplest_tree one tree list" test

let test () : bool =
  let t1 = LNode (
               LLeaf [G; T],
               [A; T],
               LNode (
                   LLeaf [T; T], 
                   [T; T], 
                   LLeaf [C; G]
               )
           ) in
  let t2 = LNode (
               LLeaf [G; T],
               [A; T],
               LNode (
                   LLeaf [T; T], 
                   [T; T], 
                   LLeaf [C; G]
               )
           ) in
  simplest_tree [t1; t2] = (t1, 4)
;; run_test "simplest_tree also two tree list" test

let test () : bool =
  let t1 = LNode (
               LLeaf [G; C],
               [A; T],
               LNode (
                   LLeaf [T; T], 
                   [T; T], 
                   LLeaf [C; G]
               )
           ) in
  let t2 = LNode (
               LLeaf [G; T],
               [A; T],
               LNode (
                   LLeaf [T; T], 
                   [T; T], 
                   LLeaf [C; G]
               )
           ) in
  let t3 = LNode (
               LLeaf [G; T],
               [A; T],
               LNode (
                   LLeaf [T; T], 
                   [T; T], 
                   LLeaf [C; G]
               )
           ) in
  simplest_tree [t1; t2; t3] = (t2, 4)
;; run_test "simplest_tree three tree list" test

(********************* simplest_greater_ape_tree tests ************************)

(* Refactoring is the process of rewriting your code to make it simpler and
 * more general without changing its behavior. Therefore, it is easy to write
 * test cases for the new version---they should compute the same answers
 * that we did before. Because of this, we don't have to write any new test
 * cases! *)

let test () : bool =
  find_simplest_tree gorilla human chimpanzee orangutan =
  simplest_greater_ape_tree ()
;; run_test "simplest_greater_ape_tree" test

let test () : bool =
  find_simplest_tree lar_gibbon pileated_gibbon siamang white_cheeked_gibbon =
  simplest_lesser_ape_tree ()
;; run_test "simplest_lesser_ape_tree" test

;; print_endline "dnaTest.ml: ran to completion."
