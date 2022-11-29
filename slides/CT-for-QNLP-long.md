---
theme: gaia
_class: lead
backgroundColor: #000
---

<style>
* { text-align: left; color: white; }
h1, strong, a { color: orange; font-weight: bold; text-decoration: none; }
img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    background-color: white;
}
</style>

<style scoped> * { text-align: center; }</style>

# Category Theory for Quantum Natural Language Processing

$$\quad$$

Alexis TOUMI

29 Novembre, Marseille

---

# Boxes and signatures

A box represents any **process** with **systems** as input and output.

![height:200px](https://imgs.search.brave.com/D2kWZbiYkflh_nmTNrcvvwXRnjWeo8ojF1o4U-ywhPo/rs:fit:1440:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5S/aXAxbzdRSW5xamRt/WFE3eGxFY19nSGFD/YyZwaWQ9QXBp)

A (monoidal) **signature** $\Sigma = (\Sigma_0, \Sigma_1, \text{dom}, \text{cod})$ is given by:

* a pair of classes $\Sigma_0, \Sigma_1$ for wires and boxes
* a pair of maps $\text{dom}, \text{cod} : \Sigma_1 \to \Sigma_0^\star$ from boxes to lists of wires.

---

# Morphisms of signatures


Given a signature $\Sigma$, we write $f : x \to y \in \Sigma$ for $f \in \Sigma_1$ and $x, y \in \Sigma_0^\star$ with $\text{dom}(f) = x$ and $\text{cod}(f) = y$.

Given two signatures $\Sigma$ and $\Sigma'$,
a **morphism** $F : \Sigma \to \Sigma'$ is a pair of maps:

- $F_0 : \Sigma_0 \to (\Sigma'_0)^\star$ from wire to list of wires
- $F_1 : \Sigma_1 \to \Sigma_1'$ from box to box

such that for all boxes $f : x \to y \in \Sigma$ in the domain we have:

$$F_1(f) : F_0(x) \to F_0(y) \in \Sigma'$$

---

# Diagrams: definition

Given a signature $\Sigma$, we can define (string) diagrams $f : x \to y \in D(\Sigma)$ by recursion:

* every box $f : x \to y \in \Sigma_1$ is also a diagram $f \in D(\Sigma)$,
* the **identity** $\text{id}(x) : x \to x$ on a list of wires $x$ is a diagram,
* so is the **composition** $g \circ f : x \to z$ of $f : x \to y$ and $g : y \to z$
* and the **tensor** $f \otimes f' : xx' \to yy'$ of $f : x \to y$ and $f' : x' \to y'$.

---

# Diagrams: definition

Diagrams are subject to three axioms.

- Tensor and composition are **associative** and **unital**.
- They satisfy the following **naturality** equation.

$$ (g \circ f) \otimes (g' \circ f') \ = \ (g \otimes g') \circ (f \otimes f') $$

From a signature $\Sigma$, we get another signature $\mathbf{C}_\Sigma$ with wires $\Sigma_0$ and diagrams $D(\Sigma)$ as boxes, and a morphism of signatures $\Sigma \hookrightarrow \mathbf{C}_\Sigma$.

---

# Diagrams: cooking

Can't be bothered to remember the axioms for diagrams? Your visual cortex has them built in!

* Wires are **ingredients**.
* Boxes are **cooking steps**.
* Diagrams are **recipes**.

In physical terms, naturality means parallel processes are **spacelike-separated** events.

![bg right:45%](https://raw.githubusercontent.com/oxford-quantum-group/discopy/main/docs/_static/imgs/crack-eggs.png)

---

# Diagrams: quantum

Quantum gate sets are signatures!

<br>

<style scoped> section img { display: block; float: right; }</style>

![width:600px](https://www.quantum-bits.org/wp-content/uploads/2018/04/annotated-teleportation-circuit.png)

* Wires are **bits** and **qubits**.
* Boxes are quantum **gates**
  and **measurements**.
* Diagrams are **circuits**.

---

# Diagrams: grammar

- Chomsky, **Syntactic Structures** (1957)

Formal grammars are signatures!

<br>

<style scoped> section img { display: block; float: right; }</style>

![width:400px](https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Cgisf-tgg.svg/1280px-Cgisf-tgg.svg.png)

* Wires are grammatical **types**.
* Boxes are grammatical **rules**.
* Diagrams are **grammatical structures**.

---

# Diagrams: grammar

- Lambek, **The mathematics of sentence structure** (1958)

![height:300px](https://cqc.pythonanywhere.com/discocat/png)

* Joachim Lambek, **Type grammar revisited** (1997)
* Clark, Sadrzadeh & Coecke, **DisCoCat** (2008)

---

# Categories: definition

A (strict monoidal) **category** $\mathbf{C}$ is a signature with three maps:

$$
\text{id} : \mathbf{C}_0^\star \to \mathbf{C}_1
$$
$$
(\circ) : \mathbf{C}_1 \times \mathbf{C}_1 \to \mathbf{C}_1
\qquad \text{and} \qquad
(\otimes) : \mathbf{C}_1 \times \mathbf{C}_1 \to \mathbf{C}_1
$$

such that associativity, unitality and naturality hold. For example:

* $\mathbf{C}_\Sigma$: wires and diagrams.
* $\mathbf{Set}$: sets and functions (with cartesian product as tensor).
* $\mathbf{Hilb}$: Hilbert spaces and linear maps (with the tensor product).

---

# Categories: theorem

A (strict monoidal) **functor** $F : \mathbf{C} \to \mathbf{D}$ is a morphism of signatures that preserves identity, composition and tensor.

**Theorem** *(Joyal & Street, 1988)*: $\mathbf{C}_\Sigma$ is the free monoidal category.

$$
\mathbf{MonCat}(\mathbf{C}_\Sigma, \mathbf{D})
\simeq \mathbf{MonSig}(\Sigma, \mathbf{D})
$$

**Intuition:** The functors $F : \mathbf{C}_\Sigma \to \mathbf{D}$ are uniquely determined by their image on boxes, i.e. a morphism of signatures $F : \Sigma \to \mathbf{D}$.


---

# Categories: grammar

- Montague, **English as a formal language** (1974)

![height:300px](https://danielmichaelcicala.github.io/act2019/assets/dialogue-challenge/3-thesis-loves-a-mortal.png)

Natural language **semantics** as a functor $F : \mathbf{Grammar} \to \mathbf{Set}$, defined using the **lambda calculus** and **first-order logic**.

---

# Categories: grammar

- Coecke, Sadrzadeh & Clark, [Mathematical Foundations for a Compositional Distributional Model of Meaning](https://arxiv.org/abs/1003.4394) (2010)

![height:250px](https://cqc.pythonanywhere.com/discocat/png?sentence=This%20sentence%20is%20a%20string%20diagram&size=small)

**DisCoCat** models are functors $F : \mathbf{Grammar} \to \mathbf{Hilb}$, unifying **Dis(tributional)** and **Co(mpositional)** semantics with **Cat(egories)**.

---

# Categories: quantum

- Abramsky & Coecke, [Categorical quantum mechanics](https://arxiv.org/abs/0808.1023) (2008)
  [A categorical semantics of quantum protocols](https://arxiv.org/abs/quant-ph/0402130) (2004)

![width:1000px](https://upload.wikimedia.org/wikipedia/commons/e/e8/Teleport.png)

The principles of quantum theory as properties of the category $\mathbf{Hilb}$.

---

# Categories: symmetric

A category is symmetric if it comes with **swaps**.

<style scoped> section img { display: block; float: left; }</style>

![height:400px](imgs/symmetric-1.png)

![height:400px](imgs/symmetric-2.png)

---

# Categories: compact

A symmetric category is compact if it comes with **cups and caps**. ![height:200px](https://discopy.readthedocs.io/en/docs/_images/snake-equation1.png)

**Entanglement** is "*the* characteristic trait of quantum mechanics".
![width:550px](imgs/classical-vs-quantum.png)

---

# Categories: cartesian

A symmetric category is cartesian if it has **copy and discard**.

![width:800px](https://math.ucr.edu/home/baez/mathematical/ACT2018/lorand/cocomm_comonoid_axioms.png)

![width:800px](imgs/cartesian-2.png)

In physical terms, the last equation (again called **naturality**) is equivalent to **causality**: the future cannot influence the past.

---

# Categorical no-deleting

**Theorem:** $\ \text{compact} \ + \ \text{discard} \implies \text{trivial}$

![width:600px](imgs/no-deleting.jpg)

- Abramsky, [No-cloning in categorical quantum mechanics](https://arxiv.org/abs/0910.2401) (2009)
- Heunen & Vicary, **Categories for Quantum Theory** (2019)

---

# Categorical no-cloning

**Lemma:** Suppose a symmetric category has both cups and copy.

![width:500px](imgs/no-cloning-lemma-1.png)![width:500px](imgs/no-cloning-lemma-2.png)

---

# Categorical no-cloning

**Theorem:** $\text{compact} \ + \ \text{copy} \implies \text{(almost) trivial}$

![width:1000px](imgs/no-cloning-proof.png)

---

# ZX-calculus

**Applications:**

- circuit simplification
- circuit compilation
- error correction
- ...
- quantum natural language processing!

https://zxcalculus.com/

![bg right:55%](https://d3i71xaburhd42.cloudfront.net/cb266c1b3e7669caab43740f35abdc8b842e9a1e/3-Figure1-1.png)

---

# QNLP: recipe

![bg right:42%](../memes/they-re-the-same-picture.jpg)

### Three ingredients

$\text{Grammar}
\xrightarrow{\text{Category Theory}}
\text{Quantum}$

$$\quad$$

### Three steps

1) **Parse** the text to get a **diagram**
2) **Map** it to quantum with a **functor**
3) **Tune** parameters to solve NLP tasks (e.g. question answering)

---

# QNLP: definition

We define a QNLP model as a monoidal functor:

$$
F : \mathbf{Grammar} \to \mathbf{Circuit}
$$

![](https://discopy.readthedocs.io/en/main/_images/functor-example2.png)

---

# QNLP: implementation

We define a QNLP model as a monoidal functor:

$$
F : \mathbf{Grammar} \to \mathbf{Circuit}
$$

```python
from discopy.quantum import qubit, Ket, H, X, CX, sqrt
from discopy.circuit import Functor

F_ = circuit.Functor(
    ob={s: Ty(), n: qubit},
    ar={Alice: Ket(0), loves: sqrt(2) @ Ket(0, 0) >> H @ X >> CX, Bob: Ket(1)})

assert F_(sentence).eval() == F(sentence)
```

---

# QNLP: training

We define a QNLP model as a **parameterised** monoidal functor:

$$
\big\{ F_\theta : \mathbf{Grammar} \to \mathbf{Circuit} \big\}_{\theta \in \Theta}
$$

Given a dataset $X = \{ (f, y) \}$ with $f$ a sentence and $y$ its truth value, we want to find the optimal functor $F^\star = F_{\theta^\star}$:

$$
\theta^\star = \mathop{\text{argmin}}_{\theta \in \Theta} \sum_{(f, y) \in X}
\text{loss}(F_\theta(f), y)
$$

We call this approach **functorial learning**, a new category-theoretic approach to structured machine learning.

---

# Diagrammatic Differentiation for Quantum Machine Learning

joint work with **Richie Yeung** and **Giovanni de Felice**

![height:350px](https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Penrose_covariant_derivate.svg/1920px-Penrose_covariant_derivate.svg.png)

---

# DisCoPy: the Python toolkit for computing with string diagrams

<style scoped> p { text-align: center; }</style>

![height:350px](https://raw.githubusercontent.com/oxford-quantum-group/discopy/main/docs/_static/imgs/snake-equation.png)

https://www.discopy.org
