# make titanic and ggplot2 avaliable in your workspace
titanic <- read.csv("titanic.csv")
library(ggplot2)

# 1 - Check the structure of titanic
str(titanic)

# 2 - Use ggplot() for the first instruction
ggplot(titanic, aes(x = Pclass, fill = Sex)) + 
  geom_bar(position = "dodge")

# 3 - Plot 2, add facet_grid() layer
ggplot(titanic, aes(x = Pclass, fill = Sex)) + 
  geom_bar(position = "dodge") + 
  facet_grid(. ~ Survived)

# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# 5 - Plot 3, but use the position object from instruction 4
ggplot(titanic, aes(x = Pclass, y = Age, color = Sex)) + 
  geom_point(size = 3, alpha = 0.5, position = posn.jd) + 
  facet_grid(. ~ Survived)


# Extra - Better answers: Would _you_ have a chance of survival?
# Define extra column indicating whether child or adult
titanic$Child <- cut(titanic$Age, c(0,17,max(titanic$Age)), 
                     labels = c("child", "adult"))

# Plot suvival ratios for different groups
ggplot(titanic, aes(x = Pclass, fill = factor(Survived))) + 
  geom_bar(position = "fill") +
  scale_fill_manual(values = c("navy", "white")) +
  facet_grid(Child ~ Sex)
