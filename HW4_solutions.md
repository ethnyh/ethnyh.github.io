# ELEC2600 Homework 4 Solutions

## Question 1

Let the lifetime of each device have mean $\mu$ and standard deviation $\sigma=2$. By the Central Limit Theorem,

$$
\bar X_n \approx \mathcal N\left(\mu,\frac{\sigma^2}{n}\right)
=\mathcal N\left(\mu,\frac{4}{n}\right).
$$

### (1.1)

We want

$$
P(|\bar X_n-\mu|\le 0.05)\ge 0.96.
$$

Standardizing,

$$
P\left(\left|Z\right|\le \frac{0.05}{2/\sqrt n}\right)\ge 0.96.
$$

Since $P(|Z|\le z)=0.96$, we need $z=z_{0.98}\approx 2.0537$. Hence

$$
\frac{0.05\sqrt n}{2}\ge 2.0537
\quad\Longrightarrow\quad
n\ge \left(\frac{2\times 2.0537}{0.05}\right)^2 \approx 6748.62.
$$

Therefore, the required sample size is

$$
\boxed{n=6749}.
$$

### (1.2)

Now $\mu=8$ and $n=2500$, so

$$
\bar X_{2500}\approx \mathcal N\left(8,\frac{4}{2500}\right),
$$

with standard deviation

$$
\frac{2}{\sqrt{2500}}=\frac{2}{50}=0.04.
$$

Thus

$$
P(|\bar X_{2500}-8|\le 0.05)
=P\left(|Z|\le \frac{0.05}{0.04}\right)
=P(|Z|\le 1.25).
$$

So

$$
P(|\bar X_{2500}-8|\le 0.05)=2\Phi(1.25)-1\approx 0.7887.
$$

Therefore,

$$
\boxed{P(|\bar X_{2500}-8|\le 0.05)\approx 0.7887.}
$$

## Question 2

Given a Poisson process with rate $\lambda=80$ customers/hour.

For time interval $t$ hours,

$$
N(t)\sim \text{Poisson}(\lambda t).
$$

### (2.1)

The first 9 minutes is $t=9/60=0.15$ hours, so

$$
\lambda t = 80(0.15)=12.
$$

Hence

$$
P(N(9\text{ min})=10)=e^{-12}\frac{12^{10}}{10!}.
$$

Therefore,

$$
\boxed{P= e^{-12}\frac{12^{10}}{10!}\approx 0.10484.}
$$

### (2.2)

The next 21 minutes is $21/60=0.35$ hours, so its mean is

$$
80(0.35)=28.
$$

By independent increments,

$$
P(N(9\text{ min})=10 \text{ and next 21 min has }30)
=\left(e^{-12}\frac{12^{10}}{10!}\right)\left(e^{-28}\frac{28^{30}}{30!}\right).
$$

Therefore,

$$
\boxed{P=\left(e^{-12}\frac{12^{10}}{10!}\right)\left(e^{-28}\frac{28^{30}}{30!}\right)\approx 0.00710.}
$$

### (2.3)

The waiting time of the first customer $T_1$ is exponential with rate $80$/hour. For 1 minute,

$$
t=\frac{1}{60}\text{ hour}.
$$

Thus

$$
P(T_1<1\text{ min})=1-e^{-80/60}.
$$

Therefore,

$$
\boxed{P=1-e^{-4/3}\approx 0.73640.}
$$

### (2.4)

$$
P(1<T_1<10\text{ min})
=P(T_1>1\text{ min})-P(T_1>10\text{ min})
$$

$$
=e^{-80/60}-e^{-800/60}.
$$

Therefore,

$$
\boxed{P=e^{-4/3}-e^{-40/3}\approx 0.26360.}
$$

### (2.5)

The second arrival time $T_2$ satisfies

$$
P(T_2<t)=P(N(t)\ge 2).
$$

For $t=3$ minutes $=3/60=0.05$ hour, the mean is

$$
\lambda t =80(0.05)=4.
$$

Hence

$$
P(T_2<3\text{ min})=1-P(N(3\text{ min})=0)-P(N(3\text{ min})=1)
$$

$$
=1-e^{-4}-4e^{-4}
=1-5e^{-4}.
$$

Therefore,

$$
\boxed{P=1-5e^{-4}\approx 0.90842.}
$$

## Question 3

Let $I_i=1$ if the $i$th draw is a Jack, and $I_i=0$ otherwise. Since there are 4 Jacks in 52 cards,

$$
p=P(I_i=1)=\frac{4}{52}=\frac{1}{13}.
$$

Each win is \$5, so

$$
S_n = 5\sum_{i=1}^n I_i.
$$

Thus $\sum_{i=1}^n I_i\sim \text{Binomial}(n,1/13)$.

### (3.1)

$$
E[S_{13}] = 5E\left[\sum_{i=1}^{13}I_i\right]
=5\cdot 13\cdot \frac{1}{13}=5.
$$

Also,

$$
\operatorname{Var}(S_{13})
=25\operatorname{Var}\left(\sum_{i=1}^{13}I_i\right)
=25\cdot 13\cdot \frac{1}{13}\left(1-\frac{1}{13}\right)
=25\cdot \frac{12}{13}.
$$

So

$$
\boxed{E[S_{13}]=5, \qquad \operatorname{Var}(S_{13})=\frac{300}{13}.}
$$

Now

$$
S_{20}=S_{13}+(S_{20}-S_{13}),
$$

and the increment $S_{20}-S_{13}$ is independent of $S_{13}$. Therefore,

$$
\operatorname{Cov}(S_{13},S_{20})
=\operatorname{Cov}(S_{13},S_{13})+\operatorname{Cov}(S_{13},S_{20}-S_{13})
=\operatorname{Var}(S_{13}).
$$

Hence

$$
\boxed{\operatorname{Cov}(S_{13},S_{20})=\frac{300}{13}.}
$$

### (3.2)

Winning \$30 in 15 games means exactly 6 Jacks in 15 draws. Hence

$$
\boxed{P(S_{15}=30)=\binom{15}{6}\left(\frac{1}{13}\right)^6\left(\frac{12}{13}\right)^9.}
$$

### (3.3)

$S_{20}=80$ means 16 Jacks in 20 games, while $S_{15}=30$ means 6 Jacks in the first 15 games. The last 5 games can contribute at most 5 more Jacks, so this is impossible. Therefore,

$$
\boxed{P(S_{20}=80\mid S_{15}=30)=0.}
$$

### (3.4)

Since the event is impossible,

$$
\boxed{P(S_{20}=80\cap S_{15}=30)=0.}
$$

### (3.5)

Starting with \$10 and paying \$2 per game, after 5 games the net amount is

$$
S_5 = 10 - 2(5) + 5W = 5W,
$$

where $W\sim \text{Binomial}(5,1/13)$ is the number of Jacks in 5 games.

We need $S_5>0$, i.e. $W\ge 1$. Thus

$$
\boxed{P(S_5>0)=1-\left(\frac{12}{13}\right)^5.}
$$

### (3.6)

Starting with \$12 and paying \$2 per game, after 20 games the net amount is

$$
S_{20}=12-2(20)+5W=-28+5W,
$$

where $W\sim \text{Binomial}(20,1/13)$.

We need

$$
-28+5W>0 \quad\Longrightarrow\quad W\ge 6.
$$

Therefore,

$$
\boxed{P(S_{20}>0)=\sum_{k=6}^{20}\binom{20}{k}\left(\frac{1}{13}\right)^k\left(\frac{12}{13}\right)^{20-k}.}
$$

## Question 4

For $i\ge 2$,

$$
Y_i=X_i-\frac12 X_{i-1}.
$$

## (4.1) $X_i$ i.i.d., $E[X_i]=400$, $\operatorname{Var}(X_i)=8000$

### Mean

$$
E[Y_i]=E[X_i]-\frac12E[X_{i-1}]
=400-\frac12(400)=200.
$$

So

$$
\boxed{\mu_Y=200.}
$$

### Autocovariance

Let $m=j-k$. Since the $X_i$ are i.i.d.,

$$
C_Y(m)=\operatorname{Cov}(Y_j,Y_k)
=\operatorname{Cov}\left(X_j-\frac12X_{j-1},\,X_k-\frac12X_{k-1}\right).
$$

Only equal-time terms survive.

For $m=0$,

$$
C_Y(0)=\operatorname{Var}(X_j)+\frac14\operatorname{Var}(X_{j-1})
=8000+\frac14(8000)=10000.
$$

For $|m|=1$,

$$
C_Y(m)= -\frac12\operatorname{Var}(X)= -\frac12(8000)=-4000.
$$

For $|m|>1$,

$$
C_Y(m)=0.
$$

Hence

$$
\boxed{
C_Y(m)=
\begin{cases}
10000, & m=0,\\
-4000, & |m|=1,\\
0, & |m|>1.
\end{cases}}
$$

### Autocorrelation

Using $R_Y(m)=E[Y_jY_{j+m}]=C_Y(m)+\mu_Y^2$ and $\mu_Y=200$,

$$
\boxed{
R_Y(m)=
\begin{cases}
50000, & m=0,\\
36000, & |m|=1,\\
40000, & |m|>1.
\end{cases}}
$$

## (4.2) $X_i$ Gaussian WSS, $E[X_i]=400$, $C_X(m)=8000e^{-|m|}$

### Mean

$$
E[Y_i]=400-\frac12(400)=200.
$$

Therefore,

$$
\boxed{\mu_Y=200.}
$$

### Autocovariance

For lag $m$,

$$
C_Y(m)=\operatorname{Cov}(Y_i,Y_{i+m})
$$

$$
=\operatorname{Cov}\left(X_i-\frac12X_{i-1},\,X_{i+m}-\frac12X_{i+m-1}\right)
$$

$$
=C_X(m)-\frac12C_X(m-1)-\frac12C_X(m+1)+\frac14C_X(m).
$$

Thus

$$
\boxed{C_Y(m)=\frac54\,C_X(m)-\frac12\,C_X(m-1)-\frac12\,C_X(m+1).}
$$

Substituting $C_X(m)=8000e^{-|m|}$,

$$
\boxed{
C_Y(m)=10000e^{-|m|}-4000e^{-|m-1|}-4000e^{-|m+1|}.}
$$

In particular, the variance is

$$
\operatorname{Var}(Y_i)=C_Y(0)=10000-8000e^{-1}.
$$

So

$$
\boxed{\operatorname{Var}(Y_i)=10000-8000e^{-1}.}
$$

### Autocorrelation

Again,

$$
R_Y(m)=C_Y(m)+\mu_Y^2=C_Y(m)+40000.
$$

Hence

$$
\boxed{R_Y(m)=40000+10000e^{-|m|}-4000e^{-|m-1|}-4000e^{-|m+1|}.}
$$

## (4.3) Joint pdf of $Y_2$ and $Y_3$

Because $(X_i)$ is a Gaussian process and $(Y_2,Y_3)$ is a linear transformation of Gaussian variables, $(Y_2,Y_3)$ is jointly Gaussian.

Its mean vector is

$$
\boldsymbol\mu=
\begin{bmatrix}
200\\
200
\end{bmatrix}.
$$

Its covariance matrix is

$$
\Sigma=
\begin{bmatrix}
\sigma_Y^2 & C_Y(1)\\
C_Y(1) & \sigma_Y^2
\end{bmatrix},
$$

where

$$
\sigma_Y^2=C_Y(0)=10000-8000e^{-1},
$$

and

$$
C_Y(1)=10000e^{-1}-4000-4000e^{-2}.
$$

Therefore, the joint pdf is

$$
\boxed{
f_{Y_2,Y_3}(y_2,y_3)
=\frac{1}{2\pi |\Sigma|^{1/2}}
\exp\left(
-\frac12
\begin{bmatrix}
y_2-200 & y_3-200
\end{bmatrix}
\Sigma^{-1}
\begin{bmatrix}
y_2-200\\
y_3-200
\end{bmatrix}
\right).}
$$

## Question 5

Since $X$ and $Y$ are jointly Gaussian, any linear combination is also Gaussian. Let

$$
Z=X-2Y.
$$

Then

$$
E[Z]=E[X]-2E[Y]=5-2(2)=1.
$$

Also,

$$
\operatorname{Var}(Z)=\operatorname{Var}(X)+4\operatorname{Var}(Y)-4\operatorname{Cov}(X,Y).
$$

## (5.1) $X$ and $Y$ uncorrelated

Since jointly Gaussian and uncorrelated implies independent,

$$
\operatorname{Cov}(X,Y)=0.
$$

Hence

$$
\operatorname{Var}(Z)=0.2+4(0.4)=1.8.
$$

So

$$
Z\sim \mathcal N(1,1.8).
$$

Therefore,

$$
\boxed{
f_Z(z)=\frac{1}{\sqrt{2\pi(1.8)}}
\exp\left(-\frac{(z-1)^2}{2(1.8)}\right),\qquad -\infty<z<\infty.}
$$

## (5.2) Correlation coefficient $\rho=0.4$

Now

$$
\operatorname{Cov}(X,Y)=\rho\,\sigma_X\sigma_Y
=0.4\sqrt{0.2}\sqrt{0.4}.
$$

Thus

$$
\operatorname{Var}(Z)=0.2+4(0.4)-4\left(0.4\sqrt{0.2}\sqrt{0.4}\right).
$$

So

$$
Z\sim \mathcal N\left(1,\;0.2+1.6-1.6\sqrt{0.08}\right).
$$

Equivalently,

$$
\operatorname{Var}(Z)=\frac{45-8\sqrt 2}{25}.
$$

Therefore,

$$
\boxed{
f_Z(z)=\frac{1}{\sqrt{2\pi\left(\frac{45-8\sqrt2}{25}\right)}}
\exp\left(-\frac{(z-1)^2}{2\left(\frac{45-8\sqrt2}{25}\right)}\right),\qquad -\infty<z<\infty.}
$$
