---
layout: post
title: "<span style='color:black;'>One sample t-test</span>"
feature-img: "assets/img/feature-img/t-test.jpeg"
tags: [Statistics]
last_modified: "2025-07-02"
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
    - 1) Dataset
        - Student's scores

    | 28 | 29 | 35 | 37 |
    | 32 | 26 | 37 | 39 |
    | 22 | 29 | 36 | 38 |

    - 2) Check assumptions
        - Normarlity
        
    - 3) Hypotheses
        - H<sub>0</sub>: The online statistics tutorial has no significant effect on exam results
    
        - H<sub>1</sub>: The online statistics tutorial has significant effect on exam results  
   
    - 4) R code
    
        ```r
        # 1. Dataset
        dataset <- c(28, 29, 35, 37, 32, 26, 37, 39, 22, 29, 36, 38)
        
        # 2. Normality check
        hist(dataset) # histogram
        
        qqnorm(dataset)
        qqline(dataset, col = "steelblue") # Q-Q plot
        
        shapiro.test(dataset) # shariro.test
        
        # 3. Student's t-test
        pop_mean <- 28 # population mean score
        
        t.test(dataset, mu = pop_mean)
        ```
        
    - 5) Results
        {% include aligner.html images="pexels/onettest_histogram.png" column=1 caption="Figure 2. histogram of dataset" %}
    
        {% include aligner.html images="pexels/onettest_qqplot.png" column=1 caption="Figure 3. Q-Q plot" %}
        
        {% include aligner.html images="pexels/onettest_shapiro.png" caption="Figure 4. shapiro.test" %}
        
        {% include aligner.html images="pexels/onettest.png" caption="Figure 5. Student's t-test" %}
        

    - 6) Interpretation
        
        - Normality
            - Histogram: No noramlly distributed, showing a slight right skwed distribution
            - Q-Q plot:
            - shapiro.test:
            
        - Student's t-test: 
        
        
<br>
- **Q2. Does the online statistics tutorial have a positive effect on exam results?**
    - 1) Dataset
        - Amount of protein from energy bars

    | 20.70 | 27.46 | 22.15 | 19.85 | 21.29 | 24.75 | 20.75 | 22.91 | 25.34 | 20.33 |       |
    | 21.54 | 21.08 | 22.14 | 19.56 | 21.10 | 18.04 | 24.12 | 19.95 | 19.72 | 18.28 |       | 
    | 16.26 | 17.46 | 20.53 | 22.12 | 25.06 | 22.44 | 19.08 | 19.88 | 21.29 | 22.33 | 25.79 | 


    - 2) Check assumptions
        - Normarlity
        
    - 3) Hypotheses
        - H<sub>0</sub>: The mean value from the sample and the predefined value does not differ significantly
    
        $$\Rightarrow$$ The online statistics tutorial has no significant effect on exam results
    
        - H<sub>1</sub>: The online statistics tutorial has significant effect on exam results  
   
    - 4) R code
        
        ```r
        # 1. Dataset
        dataset <- c(20.70, 27.46, 22.15, 19.85, 21.29, 24.75, 20.75, 22.91, 25.34, 20.33, 21.54, 21.08,
                    22.14, 19.56, 21.10, 18.04, 24.12, 19.95, 19.72, 18.28, 16.26, 17.46, 20.53, 22.12,
                    25.06, 22.44, 19.08, 19.88, 21.39, 22.33, 25.79)
             
        # 2. Normality check
        hist(dataset) # Normality check 1_histogram

        qqnorm(dataset)
        qqline(dataset, col = "steelblue")

        shapiro.test(dataset) # Normality check 3_shariro.test
        
        # 3. Student's t-test
        protein <- 20 # labeled amount protein amount

        t.test(dataset, mu = protein)
        ```

    - 5) Results
    
    
    - 6) Interpretation
    
    
    
<br>
### References
* Staistical units from <a href="https://www.mq.edu.au/" target="_blank">Macquarie University</a>
* <a href="https://chatgpt.com/" target="_blank">Chatgpt</a>
* <a href="https://datatab.net/tutorial/t-test" target="_blank">DATAtab</a>
* <a href="https://www.jmp.com/en/statistics-knowledge-portal/t-test" target="_blank">jmp.STATISTICAL DISCOVERY</a>
* <a href="https://arshren.medium.com/hypothesis-testing-an-intuitive-explanation-898d547db38d" target="_blank">Figure 1</a>
