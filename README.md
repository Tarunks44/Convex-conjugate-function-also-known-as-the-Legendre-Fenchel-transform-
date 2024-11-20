# Convex-conjugate-function-also-known-as-the-Legendre-Fenchel-transform


I'll help you understand the convex conjugate function (also known as the Legendre-Fenchel transform) using mathematical notation and explanations.

The convex conjugate $$f^*$$ of a function $$f: \mathbb{R}^n \rightarrow \mathbb{R}$$ is defined as:

$$
f^*(y) = \sup_{x \in \text{dom}(f)} \{\langle x,y \rangle - f(x)\}
$$

Where:
- $$\langle x,y \rangle$$ represents the inner product of x and y
- $$\sup$$ denotes the supremum (least upper bound)
- $$\text{dom}(f)$$ is the domain of function f

Key properties of convex conjugates:

1. **Convexity**: $$f^*$$ is always convex, even if $$f$$ is not convex

2. **Fenchel's Inequality**: For any x and y:
   $$f(x) + f^*(y) \geq \langle x,y \rangle$$

3. **Double Conjugate**: If f is convex and lower semicontinuous:
   $$(f^*)^* = f$$

Let me show you a simple example with a quadratic function:

Consider $$f(x) = \frac{1}{2}x^2$$

To find its conjugate $$f^*(y)$$:
1. Form the expression: $$xy - \frac{1}{2}x^2$$
2. Find the supremum by differentiating with respect to x:
   $$\frac{d}{dx}(xy - \frac{1}{2}x^2) = y - x = 0$$
3. Solve: $$x = y$$
4. Substitute back:
   $$f^*(y) = y^2 - \frac{1}{2}y^2 = \frac{1}{2}y^2$$

So for this quadratic function, $$f^*(y) = \frac{1}{2}y^2$$

Would you like me to provide more examples or explain any specific aspect of convex conjugates in more detail?
