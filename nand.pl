/*
 * nand representation representation
 *
 * Test on a sequence of substitution boxes and xors
 * Uses 2 layers of (xor+sbox)
 * key1 = 01, key2 = 01
 * 
 * To use load program on prolog and run with
 * ?- a.
 */

/* This test requires metagol
 * https://github.com/metagol/metagol
 */
:- use_module('../metagol').
metagol:max_clauses(50).

%% definition of tokens
/*
 * 0000 a
 * 0001 b
 * 0010 c
 * 0011 d
 * 0100 e
 * 0101 f
 * 0110 g
 * 0111 h
 * 1000 i
 * 1001 j
 * 1010 k
 * 1011 l
 * 1100 m
 * 1101 n
 * 1110 o
 * 1111 p
 */

%% First order background knowledge
/* facts
 * 	NAND
 *  0 0 1 
 *  0 1 1
 *  1 0 1
 *  1 1 0 
 */
nand(a, d).
nand(b, d).
nand(c, d).
nand(d, d).
nand(e, d).
nand(f, c).
nand(g, d).
nand(h, c).
nand(i, c).
nand(j, d).
nand(k, b).
nand(l, b).
nand(m, d).
nand(n, c).
nand(o, b).
nand(p, a).

%% predicates that can be used in learning
prim(nand/2).

%% metarules
metarule([P, Q], ([P, A, B]:-[[Q, A, B]])).

%% learning task
a :- 
  Pos = [
  	p(a, b),
  	p(b, c),
  	p(c, d),
  	p(d, a)
  ],
  learn(Pos, []).
%%
%% output
%% learning p/2
%% clauses: 1
%% p(A,B):-sbox(A,B).
%% true

%% a :- 
%%   Pos = [
%%    p(a, c),
%%    p(b, a),
%%    p(c, d),
%%    p(d, b)
%%   ],
%%   learn(Pos, []).
%%
%% output
%% learning p/2
%% clauses: 1
%% clauses: 2
%% clauses: 3
%% clauses: 4
%% clauses: 5
%% clauses: 6
%% false
  
