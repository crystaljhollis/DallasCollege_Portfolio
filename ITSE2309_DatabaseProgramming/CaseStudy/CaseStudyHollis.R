# Name: Crystal Hollis | Goal: Gain the skills I need to be a data scientist.
# Class: ITSE 2300.82700 Database Programming
# Case Study Assignment
# =============================================================================
# Dataset Files:  
# tsa_claims1.csv, in ~/data/tsa_claims1.csv

# GitHub: https://github.com/crystaljhollis/DallasCollege_Portfolio/tree/main/ITSE2309_DatabaseProgramming/CaseStudy
# A copy of the dataset and exported visuals are in ~/CaseStudy
# =============================================================================

# Case Study INSTRUCTIONS | Prerequisite Chapters 1-3
# =============================================================================
# Scenario
# You are an analyst employed by the U.S. Transportation Security 
# Administration (TSA). Your boss has asked you to produce a report that 
# answers the following questions about insurance claims against airports in 
# the U.S.
# =============================================================================
# Instructions
# 1.	Create a script for this case study. [✔]

# Setting Workspace and Importing Library
getwd() # Check current workspace
setwd("/Users/magnamediaartsllc/GitHub/DallasCollege_Portfolio/ITSE2309_DatabaseProgramming/CaseStudy/data")
getwd() # Verify change. Should be ~/CaseStudy/data
library(tidyverse)
library(ggplot2)
# =============================================================================
# 2.	Use the read_csv() function to read the data file into a variable. See 
#     chapter 5 for details if you need help using this function.  [✔]
tsa_claims <- read_csv("tsa_claims1.csv")
print(tsa_claims)

# OUTPUT:
# # A tibble: 94,848 × 13
# `Claim Number` `Date Received` `Incident Date` `Airport Code` `Airport Name`        
# <chr>          <chr>           <chr>           <chr>          <chr>                 
# 1 0909802M       4-Jan-02        12/12/2002 0:00 EWR            Newark International …
# 2 0202445M       4-Feb-02        11/26/2003 0:00 STL            Lambert St. Louis Int…
# 3 0909816M       7-Feb-02        1/6/2003 0:00   MIA            Miami International A…
# 4 2005032379513  18-Feb-02       2/5/2005 0:00   MCO            Orlando International…
# 5 2005032479636  18-Feb-02       2/17/2005 0:00  CAK            Akron-Canton Regional 
# 6 2007050124750  30-Apr-02       4/26/2007 0:00  PHL            Philadelphia Internat…
# 7 2005071188575  6-Jul-02        6/23/2005 0:00  ORD            Chicago O'Hare Intern…
# 8 2005070788431  7-Jul-02        6/17/2005 0:00  CLT            Charlotte/Douglas Int…
# 9 16410          24-Jul-02       7/10/2002 0:00  SDF            Louisville Internatio…
# 10 0702564M       19-Aug-02       6/22/2002 0:00  BWI            Baltimore/Washington …
# # ℹ 94,838 more rows
# # ℹ 8 more variables: `Airline Name` <chr>, `Claim Type` <chr>, `Claim Site` <chr>,
# #   Item <chr>, `Claim Amount` <dbl>, Status <chr>, `Close Amount` <dbl>,
# #   Disposition <chr>
# =============================================================================
# 3.	Rename columns and explain why you named them the way you did. [✔]
names(tsa_claims) # View Names
names(tsa_claims) <- gsub(" ", "", names(tsa_claims)) # Remove spaces

tsa_claims %>%
  group_by(Item) %>%
  summarize(Count = n()) %>%
  arrange(desc(Count)) # Viewing values in "Item" for insights.

unique(tsa_claims$Item) # Viewing all unique values in "Item" for insights.

tsa_claims %>%
  group_by(ClaimSite) %>%
  summarize(Count = n()) %>%
  arrange(desc(Count)) # Viewing values in "ClaimSite" for insights

tsa_claims <- tsa_claims %>%
  rename(
    ClaimStatus = Status, # Rename "Status" to "ClaimStatus"
    FinalPayoutAmount = CloseAmount, # Rename "CloseAmount" to "FinalPayoutAmount"
    ClaimOutcome = Disposition, # Rename "Disposition" to "ClaimOutcome"
    IncidentLocation = ClaimSite, # Rename "ClaimSite" to "IncidentLocation"
    IncidentItem = Item, # Rename "Item" to "IncidentItem"
    ClaimReceivedDate = DateReceived # Rename "DateReceived" to "ClaimReceivedDate"
  ) 
names(tsa_claims) # View Names

# OUTPUT:
# > names(tsa_claims) # View Names
# [1] "ClaimNumber"       "ClaimReceivedDate" "IncidentDate"      "AirportCode"      
# [5] "AirportName"       "AirlineName"       "ClaimType"         "IncidentLocation" 
# [9] "IncidentItem"      "ClaimAmount"       "ClaimStatus"       "FinalPayoutAmount"
# [13] "ClaimOutcome"    

tsa_claims # View Tibble

#------------------------------
# Reasons for renaming columns:
#------------------------------
# REMOVING SPACES:
# In R, column names with spaces can cause syntax issues. Removing the spaces 
# ensures smoother coding and compatibility.
#
# RENAMING VAGUE COLUMN NAMES: 
# "Status" → "ClaimStatus": Clarifies that status refers to the claim process.
# "CloseAmount" → "FinalPayoutAmount": Descriptive rewrite.
# "Disposition" → "ClaimOutcome": Replaces jargon with plain language.
#
# INCIDENT vs. CLAIM DISTINCTION:
# Incident columns and TSA claim columns should be clearly distinguished.
# Airport and Airline columns are kept as is. 
#
# *"Incident" Group:
# "IncidentDate" = When the event occurred (original name).
# "IncidentLocation" = Where the event occurred (formerly "ClaimSite").
# "IncidentItem" = The item involved (formerly "Item"). 
#
# *"Claim" Group:
# "ClaimNumber" = The identification number of the claim (original name).
# "ClaimDateReceived" = When TSA received the claim (formerly "DateReceived").
# "ClaimType" = The nature/category of the claim (original name).
# "ClaimAmount" = The dollar amount requested by the passenger (original name).
# "ClaimStatus" = The processing status of the claim (formerly "Status").
# "ClaimOutcome" = The final resolution (formerly "Disposition").

# =============================================================================
# 4.	Create a comment for the question. [✔]
# =============================================================================
# 5. If necessary, perform additional cleaning or preparation for the question. [✔]
# =============================================================================
# 6.	Display the data that answers the question. [✔]
# =============================================================================
# 7.	If it seems helpful, write your answer as a comment, like this:
#   # answer: [Your Answer] [✔]
# =============================================================================
# 8.	Repeat steps 4-7 for each question. [✔]
# =============================================================================
# 9.	When you are ready to submit your file for grading, please insert a 
#     comment stating what your goal is for taking this class.  [✔]
# =============================================================================
# 10.	Name your file CaseStudyLastname and submit for grading. [✔]
# =============================================================================
# QUESTIONS
# =============================================================================
# • Question 1:	What is the most common type of insurance claim?
# Answer: Passenger Property Loss
#------------------------------
# CODE (Viewing List):
#------------------------------
tsa_claims %>%
  group_by(ClaimType) %>%
  summarize(ClaimCounts = n()) %>%
  arrange(desc(ClaimCounts)) # Viewing list for insights
#------------------------------
# OUTPUT:
#------------------------------
# # A tibble: 6 × 2
# ClaimType               ClaimCounts
# <chr>                         <int>
#   1 Passenger Property Loss       60265
# 2 Property Damage               33730
# 3 Passenger Theft                 331
# 4 Employee Loss (MPCECA)          308
# 5 Personal Injury                 208
# 6 Motor Vehicle                     6
#------------------------------
# CODE (Automatic Answer for the report)
#------------------------------
top_claim <- tsa_claims %>%
  group_by(ClaimType) %>%
  summarize(ClaimCounts = n()) %>%
  arrange(desc(ClaimCounts)) %>%
  slice_head(n = 1) %>% # Using function to automatically answer
  pull(ClaimType) # pull the value from the column
print(top_claim) # Optional, I used to verify it pulled correctly
print("Question 1: What is the most common type of insurance claim?")
cat("Answer 1: The most common claim type is:", top_claim, ".") # Printing answer
#------------------------------  
# OUTPUT: 
#------------------------------
# Question 1: What is the most common type of insurance claim?
# Answer 1: The most common claim type is: Passenger Property Loss .
#------------------------------
# CODE (Visualization for the report)
#------------------------------
tsa_claims %>%
  group_by(ClaimType) %>%
  summarize(ClaimCounts = n()) %>%
  mutate(Percent = ClaimCounts / sum(ClaimCounts) * 100) %>%
  mutate(ClaimType = ifelse(Percent < 1, "Other", ClaimType)) %>%
  group_by(ClaimType) %>%
  summarize(ClaimCounts = sum(ClaimCounts)) %>%
  mutate(
    Percent = ClaimCounts / sum(ClaimCounts) * 100,
    Label = paste0(ClaimType, ": ", round(Percent, 1), "%"),
    ClaimType = factor(ClaimType, levels = ClaimType)  # lock order
  ) %>%
  ggplot(aes(x = "", y = ClaimCounts, fill = ClaimType)) +
  geom_col(width = 1) +
  geom_text(aes(label = Label), 
            position = position_stack(vjust = 0.5), size = 4) +
  coord_polar(theta = "y") +
  labs(
    title = "What is the Most Common Type of Insurance Claim?",
    subtitle = "Types under 1% grouped as 'Other'",
    fill = "Claim Type"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 11, color = "gray40"),
    legend.title = element_text(face = "bold"),
    legend.position = "right"
  )

# copy of the pie chart saved in ~/CaseStudy/exports

# =============================================================================
# •	Question 2: Which claim site within the airport are claims most commonly 
#   filed for?
# Answer: Checked Baggage
#------------------------------
# CODE (Viewing list):
#------------------------------
tsa_claims %>%
  group_by(IncidentLocation) %>% # Recall that ClaimSite was renamed
  summarize(SiteCounts = n()) %>%
  arrange(desc(SiteCounts))
#------------------------------
# OUTPUT:
#------------------------------
# # A tibble: 4 × 2
# IncidentLocation SiteCounts
# <chr>                 <int>
# 1 Checked Baggage       80553
# 2 Checkpoint            14013
# 3 Other                   280
# 4 Motor Vehicle             2
#------------------------------
# CODE (automatic answer for the report):
#------------------------------
top_incidentlocation <- tsa_claims %>%
  group_by(IncidentLocation) %>%
  summarize(SiteCounts = n()) %>%
  arrange(desc(SiteCounts)) %>%
  slice_head(n = 1) %>%
  pull(IncidentLocation)
print(top_incidentlocation) # Optional, I used to verify it pulled correctly
print("Question 2: Which claim site within the airport are claims most commonly filed for?")
cat("Answer 2: The most common claim site (location of the incident):", top_incidentlocation, ".") # Printing answer
#------------------------------
# OUTPUT:
# [1] "Question 2: Which claim site within the airport are claims most commonly filed for?"
# Answer 2: The most common claim site (location of the incident): Checked Baggage .
#------------------------------
# CODE (Visualization for the report)
#------------------------------
tsa_claims %>%
  group_by(IncidentLocation) %>%
  summarize(SiteCounts = n()) %>%
  ggplot(aes(x = reorder(IncidentLocation, SiteCounts), y = SiteCounts, fill = IncidentLocation)) +
  geom_col(width = 0.7) +
  scale_y_log10(labels = scales::comma) +
  coord_flip() +
  labs(
    title = "Which claim site within the airport are claims most commonly filed for?",
    x = "Incident Location",
    y = "Number of Claims (Logarithmic Scale)",
    fill = "Location"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 11, color = "gray40"),
    axis.text = element_text(size = 10),
    legend.position = "none"
  )

# Copy of the horizontal bar chart is in ~/CaseStudy/exports
# Used logarithmic scale due to extreme differences in value ranges.
# =============================================================================
# •	Question 3: What type of claim is made most at each claim site? 
#   Hint: You can group by multiple columns.
# Answer 3: 
# Checked Baggage: Passenger Property Loss
# Checkpoint: Property Damage
# Motor Vehicle: Passenger Property Loss
# Other: Passenger Property Loss
#------------------------------
# CODE (Viewing List):
#------------------------------
tsa_claims %>%
  group_by(IncidentLocation, ClaimType) %>%
  summarize(Counts = n(), .groups = "drop") %>%
  arrange(IncidentLocation, desc(Counts))
#------------------------------
# OUTPUT:
# A tibble: 19 × 3
# IncidentLocation ClaimType               Counts
# <chr>            <chr>                    <int>
#   1 Checked Baggage  Passenger Property Loss  53364
# 2 Checked Baggage  Property Damage          26527
# 3 Checked Baggage  Passenger Theft            294
# 4 Checked Baggage  Employee Loss (MPCECA)     275
# 5 Checked Baggage  Personal Injury             89
# 6 Checked Baggage  Motor Vehicle                4
# 7 Checkpoint       Property Damage           7092
# 8 Checkpoint       Passenger Property Loss   6740
# 9 Checkpoint       Personal Injury            112
# 10 Checkpoint       Passenger Theft             36
# 11 Checkpoint       Employee Loss (MPCECA)      32
# 12 Checkpoint       Motor Vehicle                1
# 13 Motor Vehicle    Passenger Property Loss      2
# 14 Other            Passenger Property Loss    159
# 15 Other            Property Damage            111
# 16 Other            Personal Injury              7
# 17 Other            Employee Loss (MPCECA)       1
# 18 Other            Motor Vehicle                1
# 19 Other            Passenger Theft              1
#------------------------------
# CODE (Automatic Answer for the report):
#------------------------------
top_by_location <- tsa_claims %>% # Get top claim per Incident Location
  group_by(IncidentLocation, ClaimType) %>%
  summarize(Counts = n(), .groups = "drop") %>%
  arrange(IncidentLocation, desc(Counts)) %>%
  group_by(IncidentLocation) %>%
  slice_max(order_by = Counts, n = 1)
print(top_by_location) # Optional, I used to verify it pulled correctly
print("Question 3: What is the most common claim type at each claim site (incident location)?")
cat("Answer 3: The most common claim type at each incident location:")
top_by_location %>%
  mutate(text = paste0("* ", IncidentLocation, ": ", ClaimType, " (", Counts, " claims).")) %>%
  pull(text) %>%
  cat(sep = "\n")
#------------------------------
# OUTPUT:
# [1] "Question 3: What is the most common claim type at each claim site (incident location)?"
# Answer 3: The most common claim type at each incident location:
# * Checked Baggage: Passenger Property Loss (53364 claims).
# * Checkpoint: Property Damage (7092 claims).
# * Motor Vehicle: Passenger Property Loss (2 claims).
# * Other: Passenger Property Loss (159 claims).
#------------------------------
# CODE (Visual for the report):
#------------------------------
tsa_claims %>%
  group_by(IncidentLocation, ClaimType) %>%
  summarize(Counts = n(), .groups = "drop") %>%
  ggplot(aes(x = IncidentLocation, y = Counts, fill = ClaimType)) +
  geom_col(position = "dodge", width = 0.7) +
  scale_y_log10(labels = scales::comma) +
  labs(
    title = "What is the Most Common Claim Type at Each Incident Location?",
    x = "Incident Location",
    y = "Number of Claims (Logarithmic Scale) ",
    fill = "Claim Type"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 11, color = "gray40"),
    axis.text.x = element_text(angle = 15, vjust = 1, hjust = 1),
    legend.position = "bottom",
    legend.title = element_text(face = "bold")
  )
# Copy of the visual is in ~/CaseStudy/exports
# Used logarithmic scale due to extreme differences in value ranges.

# =============================================================================
# •	Question 4: What is the median claim amount?
# Answer 4: $184 is the median claim amound.
# Note: The Max claim was $125 million, a huge outlier.
#------------------------------
# CODE (Viewing List):
#------------------------------
summary(select(tsa_claims, ClaimAmount))
#------------------------------
# OUTPUT:
#------------------------------
# ClaimAmount       
# Min.   :        0  
# 1st Qu.:       65  
# Median :      184  
# Mean   :     3635  
# 3rd Qu.:      481  
# Max.   :125000000  
#------------------------------
# CODE (Automatic Answer for the report):
#------------------------------
print("Question 4: What is the median claim amount?")
median_value <- median(tsa_claims$ClaimAmount, na.rm = TRUE)
rounded_up <- ceiling(median_value)
cat("Answer 4: The median claim amount is $", median_value, 
    ", rounded up to $", rounded_up, ".\n")
#------------------------------
# OUTPUT:
# [1] "Question 4: What is the median claim amount?"
# Answer 4: The median claim amount is $ 183.69 , rounded up to $ 184 .
#------------------------------
# CODE (Visualization for the report)
#------------------------------
ggplot(tsa_claims, aes(y = ClaimAmount)) +
  geom_boxplot() +
  scale_y_log10(labels = scales::dollar) +
  labs(title = "What is the median claim amount? (Box Plot)",
       subtitle = "Logarithmic scale highlights extreme outliers and central tendency",
       x = "", y = "Claim Amount (Log Scale)") +
  theme_minimal() +
  theme(
    axis.text.x = element_blank(), # removes text labels in x-axis
    axis.ticks.x = element_blank() # removes ticks in x-axis
  )
# Copy of the boxplot is saved in ~/CaseStudy/exports
# Used logarithmic scale due to extreme differences in value ranges.
# =============================================================================
# •	What is the overall claim approval rate for the entire U.S.? Hint: You can 
#   get the number of claims for each status add then add a column that uses 
#   the sum() function to calculate the total number of claims.
# Answer 5: 24.4% of claims were Approved. 19.4% were Settled.
# About 43.8% had some form of reimbursement (sum of Approved and Settled).
#------------------------------
# CODE (Viewing List):
#------------------------------
claimstatus <- tsa_claims %>%
  group_by(ClaimStatus) %>%
  summarize(Count = n()) # Groups by Claim Status (recall that it was renamed)
claimstatus <- claimstatus %>%
  mutate(TotalCount = sum(Count)) # Add Total Count Column
claimstatus %>%
  mutate(ApprovalRate = Count / TotalCount * 100) # Calculate Percentages
#------------------------------
# OUTPUT:
#------------------------------
# # A tibble: 5 × 4
# ClaimStatus                  Count TotalCount ApprovalRate
# <chr>                        <int>      <int>        <dbl>
# 1 Approved                     23167      94848     24.4    
# 2 Canceled                         6      94848      0.00633
# 3 Denied                       53273      94848     56.2    
# 4 Pending response from claim…     1      94848      0.00105
# 5 Settled                      18401      94848     19.4 
#------------------------------
# CODE (Automatic Answer for the report):
#------------------------------
claimstatus <- tsa_claims %>%
  group_by(ClaimStatus) %>%
  summarize(Count = n()) %>%
  mutate(
    TotalCount = sum(Count),
    ApprovalRate = Count / TotalCount * 100
  ) # summarizes and calculates approval rate

approved_rate <- claimstatus %>%
  filter(ClaimStatus == "Approved") %>%
  pull(ApprovalRate) # pull values for Approved

settled_rate <- claimstatus %>%
  filter(ClaimStatus == "Settled") %>%
  pull(ApprovalRate) # pull values for Settled

total_reimbursement <- approved_rate + settled_rate # adds the two together

print("Question 5: What is the overall claim approval rate for the entire U.S.?")
cat(
  "Answer 5: ", 
  round(approved_rate, 1), "% of claims were Approved. ",
  round(settled_rate, 1), "% were Settled.\n",
  "About ", round(total_reimbursement, 1), "% of claims received some form of reimbursement.\n",
  sep = ""
)
#------------------------------
# OUTPUT:
#------------------------------
# [1] "Question 5: What is the overall claim approval rate for the entire U.S.?"
# Answer 5: 24.4% of claims were Approved. 19.4% were Settled.
# About 43.8% of claims received some form of reimbursement.
#------------------------------
# CODE (Visual for the report):
#------------------------------
claimstatus %>%
  mutate(Label = paste0(ClaimStatus, ": ", round(ApprovalRate, 1), "%")) %>%
  ggplot(aes(x = "", y = Count, fill = ClaimStatus)) +
  geom_col(width = 1) +
  geom_text(aes(label = ifelse(ApprovalRate >= 1, Label, "")), 
            position = position_stack(vjust = 0.5), size = 4) +
  coord_polar(theta = "y") +
  labs(
    title = "What is the overall claim approval rate for the entire U.S.?",
    subtitle = "Based on claim status percentages",
    fill = "Claim Status"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 11, color = "gray40"),
    legend.title = element_text(face = "bold"),
    legend.position = "right"
  )

# copy of the pie chart is in ~/CaseStudy/exports
# Report is in ~/CaseStudy
# =============================================================================
# END OF INSTRUCTIONS and CASE STUDY