Theorem impl_rozdz : (A -> B) -> (A -> C) -> A -> B -> C.
Proof.
intro H.
intro HA.
intro HB.
intro HC.
apply HA.
ass HB.
Qed.

Theorem impl_komp : (A -> B) -> (B -> C) -> A -> C.
Proof.
intro H.
intro HA.
intro HB.
apply HA.
apply H.
ass HB.
Qed.


Theorem impl_perm : (A -> B -> C) -> B -> A -> C. 
Proof.
intro H.
intro HA.
intro HB.
apply H.
ass HB.
ass HA.
Qed.

Theorem impl_conj : A -> B -> A /\ B.
Proof.
intro H.
intro HA.
con_i.
ass H.
ass HA.
Qed.

Theorem conj_elim_l : A /\ B -> A. 
Proof.
intro H.
elim H.
intro HA.
intro HB.
ass HA.
Qed.


Theorem disj_intro_l : A -> A \/ B.
Proof.
intro H.
left.
ass H.
Qed.

Theorem rozl_elim : A \/ B -> (A -> C) -> (B -> C) -> C. 
Proof.
intro H.
intro HA.
intro HB.
elim H.
ass HA.
ass HB.
Qed


Theorem diamencik : (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D.
Proof.
intro H.
intro HA.
intro HB.
intro HC.
apply HB.
apply H.
ass HC.
apply HA.
ass HC.
Qed.


Theorem slaby_peirce : ((((A -> B) -> A) -> A) -> B) -> B.
Proof.
intro H.
apply H.
intro HA.
apply HA.
intro HB.
apply H.
intro HC.
ass HB.
Qed.

Theorem rozl_impl_rozdz : (A \/ B -> C) -> (A -> C) /\ (B -> C).
Proof.
intro H.
split.
intro HA.
apply H.
left.
ass HA.
intro HB.
apply H.
right.
ass HB.
Qed.

Theorem rozl_impl_rozdz_odw : (A -> C) /\ (B -> C) -> A \/ B -> C.
Proof.
intro H.
intro HA.
elim H.
intro HB.
intro HC.
elim HA.
ass HB.
ass HC.
Qed.

Theorem curry : (A /\ B -> C) -> A -> B -> C.
Proof.
intro H.
intro HA.
intro HB.
apply H.
con_i.
ass HA.
ass HB.
Qed.

Theorem uncurry : (A -> B -> C) -> A /\ B -> C.
Proof.
intro H.
intro HA.
apply H.
elim HA.
intro HB.
intro HC.
ass HB.
elim HA.
intro HB.
intro HC.
ass HC.
Qed.
