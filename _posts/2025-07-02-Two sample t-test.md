---
layout: post
title: "<span style='color:black;'>Two sample t-test</span>"
feature-img: "assets/img/feature-img/t-test.jpeg"
tags: [Statistics]
last_modified: "2025-07-02"
excerpt_separator: <!--more-->
---

### Independent samples t-test
> A test to determine whether there is a significant difference between **the mean of two different groups**
<!--more-->

<br>
#### 1. Assumptions
* The data have been ramdomly sampled from population
* The data in each group is normally distributed
* The two groups are independent
* There is homogeneity of variance (equal variances between the two groups)

<br>
#### 2. Hypotheses

<u>Two tailed (non-directional)<u>
* Null hypothesis (H<sub>0</sub>): 

$$
H_0: \mu = \mu_0
$$
 
* Alternative hypotehsis (H<sub>1</sub>): 

$$
H_1: \mu \ne \mu_0
$$

<u>One tailed (Directional)<u>
* Null hypothesis (H<sub>0</sub>): The mean of group 1 is greater / less than or equal to the mean of group 2

$$ {\text{Left tailed test}} \quad H_0: \mu_1 \ge \mu_2 $$

$$ {\text{Right tailed test}} \quad H_0: \mu_1 \le \mu_2 $$

 
* Alternative hypotehsis (H<sub>1</sub>): The mean of group 1 is less / greater than the mean of group 2

$$ {\text{Left tailed test}} \quad H_1: \mu_1 < \mu_2 $$

$$ {\text{Right tailed test}} \quad H_1: \mu_1 > \mu_2 $$

<br>
#### 3. Test results
- t-value or t-statistics

$$ t = \frac{\text{Difference of group averages}}{\text{Standard error of difference}} = \frac{\bar{x_1} - \bar{x_2}}{s_{\bar{x}_1 - \bar{x}_2}}$$

- degree of freedom (df)

$$ df = n_1 + n_2 - 2 $$

- Effect size (Conhen's *d*)

$$ d = t \times \sqrt{\frac{n_1 + n_2}{n_1 \cdot n_2}} $$

- p-value

<br>
#### 4. How to interpret with the test results

- t-value
    - t-value > critical t-value = reject H<sub>0</sub>

- p-value
    - p-value $$< \alpha$$ (significant level) = reject H<sub>0</sub>
    - p-value $$\ge \alpha$$ (significant level) = fail to reject H<sub>0</sub>

- Effective size (Conhen's *d*)
    - ~ 0.2: small effect, but noticeable difference
    - ~ 0.5: medium effect, likely meaningful difference
    - ~ 0.8: large effect, very meaningful difference

<br>
#### 5. Examples
- **Q1. Is there a significant difference between the examination results in the summer and winter semester?**
    - <u>1) Dataset<u>
    
    - <u>2) Check assumptions<u>
    
    - <u>3) Hypotheses<u>
    
    - <u>4) Results & Interpretation<u>
    
    - <u>5) R code & results<u>

<br>
- **Q2. Is there a significant difference between the examination results in the summer and winter semester?**
    - <u>1) Dataset<u>
    
    - <u>2) Check assumptions<u>
    
    - <u>3) Hypotheses<u>
    
    - <u>4) Results & Interpretation<u>
    
    - <u>5) R code & results<u>

### References
* Staistical units from <a href="https://www.mq.edu.au/" target="_blank">Macquarie University</a>
* <a href="https://chatgpt.com/" target="_blank">Chatgpt</a>
* <a href="https://datatab.net/tutorial/t-test" target="_blank">DATAtab</a>
* <a href="https://www.jmp.com/en/statistics-knowledge-portal/t-test" target="_blank">jmp.STATISTICAL DISCOVERY</a>
