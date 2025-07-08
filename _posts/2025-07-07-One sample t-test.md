---
layout: post
title: "<span style='color:black;'>One sample t-test</span>"
feature-img: "assets/img/feature-img/t-test.jpeg"
tags: [Statistics]
last_modified: "2025-07-07"
excerpt_separator: <!--more-->
---

### One sample t-test (Student's t-test)
> A test to determine whether there is a significant difference between **the mean of a population** and **the mean of a single sample**
<!--more-->

<br>
#### 1. Assumptions
- The data have been ramdomly sampled from population
- The data is normally distributed

<br>   
#### 2. Hypotheses

<u>Two tailed (non-directional)<u>
- Null hypothesis (H<sub>0</sub>): The mean value of the population is equal to the sample mean
 
$$ H_0: \mu = \mu_0 $$
 
- Alternative hypothesis (H<sub>1</sub>): The mean value of the population is not equal to the sample mean

$$ H_1: \mu \ne \mu_0 $$

<u>One tailed (directional)<u>
- Null hypothesis (H<sub>0</sub>): The mean value of the population is equal to or greater than (or less than) that of the specified value.

$$ {\text{Left tailed test}} \quad H_0: \mu \ge \mu_0 $$

$$ {\text{Right tailed test}} \quad H_0: \mu \le \mu_0 $$

- Alternative hypothesis (H<sub>1</sub>): The mean value of the population is smaller (or larger) than the specified values.

$$ {\text{Left tailed test}} \quad H_1: \mu > \mu_0 $$

$$ {\text{Right tailed test}} \quad H_1: \mu < \mu_0 $$

{% include aligner.html images="pexels/onetail.png" column=1 caption="Figure 1. Comparison between two tailed test and one tailed test" %}

<br>
#### 3. Test results
- t-value or t-statistics

$$ t = \frac{\text{Difference between mean values}}{\text{Standard deviation from the mean}} = \frac{\bar{x} - \mu_0}{s / \sqrt{n}}$$

- degree of freedom (df)

$$ df = n-1 $$

- p-value

<br>
#### 4. How to interpret with the test results

- t-value
    - The larger the magnitude of t, the more this argues against the null hypothesis
    
    $$\Rightarrow$$ t-value > critical t-value = reject H<sub>0</sub>

- p-value
    - p-value $$< \alpha$$ (significant level) = reject H<sub>0</sub>
    - p-value $$\ge \alpha$$ (significant level) = fail to reject H<sub>0</sub>
    
<br>
#### 5. Examples
- **Q1. Does the online statistics tutorial have a positive effect on exam results?**
    - <u>1) Dataset<u>
        - Student's scores

    | 28 | 29 | 35 | 37 |
    | 32 | 26 | 37 | 39 |
    | 22 | 29 | 36 | 38 |

    - <u>2) Check assumptions<u>
        - Normarlity
        
    - <u>3) Hypotheses<u>
        - H<sub>0</sub>: The online statistics tutorial has no significant effect on exam results
    
        - H<sub>1</sub>: The online statistics tutorial has significant effect on exam results  
   
    - <u>4) Resuts & Interpretation<u>
        
        - Normality
            - Histogram: Not normally distributed, showing a slight right-skewed distribution
            - Q-Q plot: Most points are close to the line, indicating that normality is acceptable
            - shapiro.test: The dataset appears to be normally distributed, as the p-value (0.3116) > 0.05
            
        - Student's t-test
            - t-value: The calculated t-value (2.7462) is greater than the critical t-value (2.200985), suggesting that H<sub>0</sub> is likely to be rejected
            - p-value: The p-value is 0.01902, which indicates that H<sub>0</sub> should be rejected
            - 95% confident level: The true population mean is likely to lie within the interval [28.8601, 35.0636]
            - Sample mean: The sample mean is 32.3333
            
        
    - <u>5) R code & results<u>
    
        ```r
        # 1. Dataset
        dataset <- c(28, 29, 35, 37, 32, 26, 37, 39, 22, 29, 36, 38)
        
        # 2. Normality check
        hist(dataset) # histogram
        ```
        
        {% include aligner.html images="pexels/onettest_histogram_q1.png" column=1 caption="Figure 2. histogram of dataset" %}
       
        
        # 2. Normality check
        qqnorm(dataset)
        qqline(dataset, col = "steelblue") # Q-Q plot
        
        
        {% include aligner.html images="pexels/onettest_qqplot_q1.png" column=1 caption="Figure 3. Q-Q plot" %}
        
               
        # 2. Normality check
        shapiro.test(dataset) # shariro.test
        
        {% include aligner.html images="pexels/onettest_shapiro_q1.png" caption="Figure 4. shapiro.test" %}
        
        
        # 3. Student's t-test
        pop_mean <- 28 # population mean score
        
        t.test(dataset, mu = pop_mean)

        {% include aligner.html images="pexels/onettest_q1.png" caption="Figure 5. Student's t-test" %}
        
        # 4. Critical t-value
        
        qt(p=.05/2, df=11, lower.tail=FALSE) # critical t-value

        {% include aligner.html images="pexels/onettest_criticalTValue_q1.png" caption="Figure 6. Critical t-value with df 11" %}

        
        
<br>
- **Q2. Does the average amount of protein in energy bars equal 20 g?**
    - <u>1) Dataset<u>
        - Amount of protein from energy bars

    | 20.70 | 27.46 | 22.15 | 19.85 | 21.29 | 24.75 | 20.75 | 22.91 | 25.34 | 20.33 |       |
    | 21.54 | 21.08 | 22.14 | 19.56 | 21.10 | 18.04 | 24.12 | 19.95 | 19.72 | 18.28 |       | 
    | 16.26 | 17.46 | 20.53 | 22.12 | 25.06 | 22.44 | 19.08 | 19.88 | 21.29 | 22.33 | 25.79 | 


    - <u>2) Check assumptions<u>
        - Normarlity
        
    - <u>3) Hypotheses<u>
        - H<sub>0</sub>: The mean protein content of energy bars is equal to 20 g
    
        - H<sub>1</sub>: The mean protein content of energy bars is not equal to 20 g

    - <u>4) Resuts & Interpretation<u>
        
        - Normality
            - Histogram: Approximately normally distributed, showing a slight left skew
            - Q-Q plot: Most middle points are close to the line, but the points at the edges deviate slightly from the line
            - shapiro.test: The dataset appears to be normally distributed, as the p-value (0.7191) > 0.05
            
        - Student's t-test
            - t-value: The calculated t-value (3.0668) is greater than the critical t-value (2.0472), suggesting that H<sub>0</sub> is likely to be rejected
            - p-value: The p-value is 0.04553, which indicates that H<sub>0</sub> should be rejected
            - 95% confident level: The true population mean is likely to lie within the interval [20.46771, 22.33229]
            - Sample mean: The sample mean is 21.4
            
        
    - <u>5) R code & results<u>
        
        ```r
        # 1. Dataset
        dataset <- c(20.70, 27.46, 22.15, 19.85, 21.29, 24.75, 20.75, 22.91, 25.34, 20.33, 21.54, 21.08,
                    22.14, 19.56, 21.10, 18.04, 24.12, 19.95, 19.72, 18.28, 16.26, 17.46, 20.53, 22.12,
                    25.06, 22.44, 19.08, 19.88, 21.39, 22.33, 25.79)
             
        # 2. Normality check
        hist(dataset) # histogram
        ```
        {% include aligner.html images="pexels/onettest_histogram_q2.png" column=1 caption="Figure 7. histogram of dataset" %}

        
        # 2. Normality check        
        qqnorm(dataset)
        qqline(dataset, col = "steelblue") # Q-Q plot
        
        {% include aligner.html images="pexels/onettest_qqplot_q2.png" column=1 caption="Figure 8. Q-Q plot" %}
                
        # 2. Normality check  
        shapiro.test(dataset) # shariro.test

        {% include aligner.html images="pexels/onettest_shapiro_q2.png" caption="Figure 9. shapiro.test" %}
        
        # 3. Student's t-test
        protein <- 20 # labeled amount protein amount

        t.test(dataset, mu = protein)
        
        {% include aligner.html images="pexels/onettest_q2.png" caption="Figure 10. Student's t-test" %}


        # 4. Critical t-value
        
        qt(p=.05/2, df=22, lower.tail=FALSE) # critical t-value
        
        {% include aligner.html images="pexels/onettest_criticalTValue_q2.png" caption="Figure 11. Critical t-value with df 30" %}
    
    
<br>
### References
* Staistical units from <a href="https://www.mq.edu.au/" target="_blank">Macquarie University</a>
* <a href="https://chatgpt.com/" target="_blank">Chatgpt</a>
* <a href="https://datatab.net/tutorial/t-test" target="_blank">DATAtab</a>
* <a href="https://www.jmp.com/en/statistics-knowledge-portal/t-test" target="_blank">jmp.STATISTICAL DISCOVERY</a>
* <a href="https://arshren.medium.com/hypothesis-testing-an-intuitive-explanation-898d547db38d" target="_blank">Figure 1</a>
