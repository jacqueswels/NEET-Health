library(haven)


base_path <- "/Users/jacqueswels/Documents/DATABASES/USOC2025/stata/stata13_se/ukhls/"

# Wave a
a_indresp <- read_dta(paste0(base_path, "a_indresp.dta")) 
# Start with indresp and add indall (keeping all indresp cases)
wavea <- a_indresp
wavea$wave <- "2009"
# remove prefix x_ #
names(wavea) <- sub("^a_", "", names(wavea))
wavea <- wavea[wavea$age_dv >= 16 & wavea$age_dv <= 24, ]

a_indall <- read_dta(paste0(base_path, "a_indall.dta"))
a_indall_clean <- a_indall[c("pidp", "a_hidp", "a_imd2015qe_dv", "a_imd2019qe_dv", 
                             "a_imd2017qni_dv", "a_imd2016qs_dv", "a_imd2020qs_dv",
                             "a_imd2014qw_dv", "a_imd2019qw_dv")]
names(a_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavea <- merge(wavea, a_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

a_hhresp <- read_dta(paste0(base_path, "a_hhresp.dta"))
a_hhresp_clean <- a_hhresp[c("a_hidp", "a_fihhmnnet1_dv")]
names(a_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavea <- merge(wavea, a_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavea$fihhmnnet1_dv=as.numeric(wavea$fihhmnnet1_dv)


# Wave b
b_indresp <- read_dta(paste0(base_path, "b_indresp.dta")) 
# Start with indresp and add indall (keeping all indresp cases)
waveb <- b_indresp
waveb$wave <- "2010"
# remove prefix x_ #
names(waveb) <- sub("^b_", "", names(waveb))
waveb <- waveb[waveb$age_dv >= 16 & waveb$age_dv <= 24, ]

b_indall <- read_dta(paste0(base_path, "b_indall.dta"))
b_indall_clean <- b_indall[c("pidp", "b_hidp", "b_imd2015qe_dv", "b_imd2019qe_dv", 
                             "b_imd2017qni_dv", "b_imd2016qs_dv", "b_imd2020qs_dv",
                             "b_imd2014qw_dv", "b_imd2019qw_dv")]
names(b_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
waveb <- merge(waveb, b_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

b_hhresp <- read_dta(paste0(base_path, "b_hhresp.dta"))
b_hhresp_clean <- b_hhresp[c("b_hidp", "b_fihhmnnet1_dv")]
names(b_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
waveb <- merge(waveb, b_hhresp_clean, by = c("hidp"), all.x = TRUE)
waveb$fihhmnnet1_dv=as.numeric(waveb$fihhmnnet1_dv)



# Wave c
c_indresp <- read_dta(paste0(base_path, "c_indresp.dta")) 
# Start with indresp and add indall (keeping all indresp cases)
wavec <- c_indresp
wavec$wave <- "2011"
# remove prefix x_ #
names(wavec) <- sub("^c_", "", names(wavec))
wavec <- wavec[wavec$age_dv >= 16 & wavec$age_dv <= 24, ]

c_indall <- read_dta(paste0(base_path, "c_indall.dta"))
c_indall_clean <- c_indall[c("pidp", "c_hidp", "c_imd2015qe_dv", "c_imd2019qe_dv", 
                             "c_imd2017qni_dv", "c_imd2016qs_dv", "c_imd2020qs_dv",
                             "c_imd2014qw_dv", "c_imd2019qw_dv")]
names(c_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavec <- merge(wavec, c_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

c_hhresp <- read_dta(paste0(base_path, "c_hhresp.dta"))
c_hhresp_clean <- c_hhresp[c("c_hidp", "c_fihhmnnet1_dv")]
names(c_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavec <- merge(wavec, c_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavec$fihhmnnet1_dv=as.numeric(wavec$fihhmnnet1_dv)


# Wave d
d_indresp <- read_dta(paste0(base_path, "d_indresp.dta")) 
waved <- d_indresp
waved$wave <- "2012"
names(waved) <- sub("^d_", "", names(waved))
waved <- waved[waved$age_dv >= 16 & waved$age_dv <= 24, ]

d_indall <- read_dta(paste0(base_path, "d_indall.dta"))
d_indall_clean <- d_indall[c("pidp", "d_hidp", "d_imd2015qe_dv", "d_imd2019qe_dv", 
                             "d_imd2017qni_dv", "d_imd2016qs_dv", "d_imd2020qs_dv",
                             "d_imd2014qw_dv", "d_imd2019qw_dv")]
names(d_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
waved <- merge(waved, d_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

d_hhresp <- read_dta(paste0(base_path, "d_hhresp.dta"))
d_hhresp_clean <- d_hhresp[c("d_hidp", "d_fihhmnnet1_dv")]
names(d_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
waved <- merge(waved, d_hhresp_clean, by = c("hidp"), all.x = TRUE)
waved$fihhmnnet1_dv=as.numeric(waved$fihhmnnet1_dv)


# Wave e
e_indresp <- read_dta(paste0(base_path, "e_indresp.dta")) 
wavee <- e_indresp
wavee$wave <- "2013"
names(wavee) <- sub("^e_", "", names(wavee))
wavee <- wavee[wavee$age_dv >= 16 & wavee$age_dv <= 24, ]

e_indall <- read_dta(paste0(base_path, "e_indall.dta"))
e_indall_clean <- e_indall[c("pidp", "e_hidp", "e_imd2015qe_dv", "e_imd2019qe_dv", 
                             "e_imd2017qni_dv", "e_imd2016qs_dv", "e_imd2020qs_dv",
                             "e_imd2014qw_dv", "e_imd2019qw_dv")]
names(e_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavee <- merge(wavee, e_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

e_hhresp <- read_dta(paste0(base_path, "e_hhresp.dta"))
e_hhresp_clean <- e_hhresp[c("e_hidp", "e_fihhmnnet1_dv")]
names(e_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavee <- merge(wavee, e_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavee$fihhmnnet1_dv=as.numeric(wavee$fihhmnnet1_dv)


# Wave f
f_indresp <- read_dta(paste0(base_path, "f_indresp.dta")) 
# Start with indresp and add indall (keeping all indresp cases)
wavef <- f_indresp
wavef$wave <- "2014"
# remove prefix x_ #
names(wavef) <- sub("^f_", "", names(wavef))
wavef <- wavef[wavef$age_dv >= 16 & wavef$age_dv <= 24, ]

f_indall <- read_dta(paste0(base_path, "f_indall.dta"))
f_indall_clean <- f_indall[c("pidp", "f_hidp", "f_imd2015qe_dv", "f_imd2019qe_dv", 
                             "f_imd2017qni_dv", "f_imd2016qs_dv", "f_imd2020qs_dv",
                             "f_imd2014qw_dv", "f_imd2019qw_dv")]
names(f_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavef <- merge(wavef, f_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

f_hhresp <- read_dta(paste0(base_path, "f_hhresp.dta"))
f_hhresp_clean <- f_hhresp[c("f_hidp", "f_fihhmnnet1_dv")]
names(f_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavef <- merge(wavef, f_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavef$fihhmnnet1_dv=as.numeric(wavef$fihhmnnet1_dv)



# Wave g
g_indresp <- read_dta(paste0(base_path, "g_indresp.dta")) 
waveg <- g_indresp
waveg$wave <- "2015"
names(waveg) <- sub("^g_", "", names(waveg))
waveg <- waveg[waveg$age_dv >= 16 & waveg$age_dv <= 24, ]

g_indall <- read_dta(paste0(base_path, "g_indall.dta"))
g_indall_clean <- g_indall[c("pidp", "g_hidp", "g_imd2015qe_dv", "g_imd2019qe_dv", 
                             "g_imd2017qni_dv", "g_imd2016qs_dv", "g_imd2020qs_dv",
                             "g_imd2014qw_dv", "g_imd2019qw_dv")]
names(g_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
waveg <- merge(waveg, g_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

g_hhresp <- read_dta(paste0(base_path, "g_hhresp.dta"))
g_hhresp_clean <- g_hhresp[c("g_hidp", "g_fihhmnnet1_dv")]
names(g_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
waveg <- merge(waveg, g_hhresp_clean, by = c("hidp"), all.x = TRUE)
waveg$fihhmnnet1_dv=as.numeric(waveg$fihhmnnet1_dv)


# Wave h
h_indresp <- read_dta(paste0(base_path, "h_indresp.dta")) 
waveh <- h_indresp
waveh$wave <- "2016"
names(waveh) <- sub("^h_", "", names(waveh))
waveh <- waveh[waveh$age_dv >= 16 & waveh$age_dv <= 24, ]

h_indall <- read_dta(paste0(base_path, "h_indall.dta"))
h_indall_clean <- h_indall[c("pidp", "h_hidp", "h_imd2015qe_dv", "h_imd2019qe_dv", 
                             "h_imd2017qni_dv", "h_imd2016qs_dv", "h_imd2020qs_dv",
                             "h_imd2014qw_dv", "h_imd2019qw_dv")]
names(h_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
waveh <- merge(waveh, h_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

h_hhresp <- read_dta(paste0(base_path, "h_hhresp.dta"))
h_hhresp_clean <- h_hhresp[c("h_hidp", "h_fihhmnnet1_dv")]
names(h_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
waveh <- merge(waveh, h_hhresp_clean, by = c("hidp"), all.x = TRUE)
waveh$fihhmnnet1_dv=as.numeric(waveh$fihhmnnet1_dv)


# Wave i
i_indresp <- read_dta(paste0(base_path, "i_indresp.dta")) 
wavei <- i_indresp
wavei$wave <- "2017"
names(wavei) <- sub("^i_", "", names(wavei))
wavei <- wavei[wavei$age_dv >= 16 & wavei$age_dv <= 24, ]

i_indall <- read_dta(paste0(base_path, "i_indall.dta"))
i_indall_clean <- i_indall[c("pidp", "i_hidp", "i_imd2015qe_dv", "i_imd2019qe_dv", 
                             "i_imd2017qni_dv", "i_imd2016qs_dv", "i_imd2020qs_dv",
                             "i_imd2014qw_dv", "i_imd2019qw_dv")]
names(i_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavei <- merge(wavei, i_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

i_hhresp <- read_dta(paste0(base_path, "i_hhresp.dta"))
i_hhresp_clean <- i_hhresp[c("i_hidp", "i_fihhmnnet1_dv")]
names(i_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavei <- merge(wavei, i_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavei$fihhmnnet1_dv=as.numeric(wavei$fihhmnnet1_dv)


# Wave j
j_indresp <- read_dta(paste0(base_path, "j_indresp.dta")) 
# Start with indresp and add indall (keeping all indresp cases)
wavej <- j_indresp
wavej$wave <- "2018"
# remove prefix x_ #
names(wavej) <- sub("^j_", "", names(wavej))
wavej <- wavej[wavej$age_dv >= 16 & wavej$age_dv <= 24, ]

j_indall <- read_dta(paste0(base_path, "j_indall.dta"))
j_indall_clean <- j_indall[c("pidp", "j_hidp", "j_imd2015qe_dv", "j_imd2019qe_dv", 
                             "j_imd2017qni_dv", "j_imd2016qs_dv", "j_imd2020qs_dv",
                             "j_imd2014qw_dv", "j_imd2019qw_dv")]
names(j_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavej <- merge(wavej, j_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

j_hhresp <- read_dta(paste0(base_path, "j_hhresp.dta"))
j_hhresp_clean <- j_hhresp[c("j_hidp", "j_fihhmnnet1_dv")]
names(j_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavej <- merge(wavej, j_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavej$fihhmnnet1_dv=as.numeric(wavej$fihhmnnet1_dv)


# Wave k
k_indresp <- read_dta(paste0(base_path, "k_indresp.dta")) 
# Start with indresp and add indall (keeping all indresp cases)
wavek <- k_indresp
wavek$wave <- "2019"
names(wavek) <- sub("^k_", "", names(wavek))
wavek <- wavek[wavek$age_dv >= 16 & wavek$age_dv <= 24, ]

k_indall <- read_dta(paste0(base_path, "k_indall.dta"))
k_indall_clean <- k_indall[c("pidp", "k_hidp", "k_imd2015qe_dv", "k_imd2019qe_dv", 
                             "k_imd2017qni_dv", "k_imd2016qs_dv", "k_imd2020qs_dv",
                             "k_imd2014qw_dv", "k_imd2019qw_dv")]
names(k_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavek <- merge(wavek, k_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

k_hhresp <- read_dta(paste0(base_path, "k_hhresp.dta"))
k_hhresp_clean <- k_hhresp[c("k_hidp", "k_fihhmnnet1_dv")]
names(k_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavek <- merge(wavek, k_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavek$fihhmnnet1_dv=as.numeric(wavek$fihhmnnet1_dv)


# Wave l
l_indresp <- read_dta(paste0(base_path, "l_indresp.dta")) 
wavel <- l_indresp
wavel$wave <- "2020"
names(wavel) <- sub("^l_", "", names(wavel))
wavel <- wavel[wavel$age_dv >= 16 & wavel$age_dv <= 24, ]

l_indall <- read_dta(paste0(base_path, "l_indall.dta"))
l_indall_clean <- l_indall[c("pidp", "l_hidp", "l_imd2015qe_dv", "l_imd2019qe_dv", 
                             "l_imd2017qni_dv", "l_imd2016qs_dv", "l_imd2020qs_dv",
                             "l_imd2014qw_dv", "l_imd2019qw_dv")]
names(l_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavel <- merge(wavel, l_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

l_hhresp <- read_dta(paste0(base_path, "l_hhresp.dta"))
l_hhresp_clean <- l_hhresp[c("l_hidp", "l_fihhmnnet1_dv")]
names(l_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavel <- merge(wavel, l_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavel$fihhmnnet1_dv=as.numeric(wavel$fihhmnnet1_dv)


# Wave m
m_indresp <- read_dta(paste0(base_path, "m_indresp.dta"), encoding = "latin1") 
wavem <- m_indresp
wavem$wave <- "2021"
# remove prefix x_ #
names(wavem) <- sub("^m_", "", names(wavem))
wavem <- wavem[wavem$age_dv >= 16 & wavem$age_dv <= 24, ]

m_indall <- read_dta(paste0(base_path, "m_indall.dta"))
m_indall_clean <- m_indall[c("pidp", "m_hidp", "m_imd2015qe_dv", "m_imd2019qe_dv", 
                             "m_imd2017qni_dv", "m_imd2016qs_dv", "m_imd2020qs_dv",
                             "m_imd2014qw_dv", "m_imd2019qw_dv")]
names(m_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
wavem <- merge(wavem, m_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

m_hhresp <- read_dta(paste0(base_path, "m_hhresp.dta"))
m_hhresp_clean <- m_hhresp[c("m_hidp", "m_fihhmnnet1_dv")]
names(m_hhresp_clean) <- c("hidp", "fihhmnnet1_dv")
wavem <- merge(wavem, m_hhresp_clean, by = c("hidp"), all.x = TRUE)
wavem$fihhmnnet1_dv=as.numeric(wavem$fihhmnnet1_dv)


# Wave n
n_indresp <- read_dta(paste0(base_path, "n_indresp.dta"), encoding = "latin1")  
waven <- n_indresp
waven$wave <- "2022"
names(waven) <- sub("^n_", "", names(waven))
waven <- waven[waven$age_dv >= 16 & waven$age_dv <= 24, ]

n_indall <- read_dta(paste0(base_path, "n_indall.dta"))
n_indall_clean <- n_indall[c("pidp", "n_hidp", "n_imd2015qe_dv", "n_imd2019qe_dv", 
                             "n_imd2017qni_dv", "n_imd2016qs_dv", "n_imd2020qs_dv",
                             "n_imd2014qw_dv", "n_imd2019qw_dv")]
names(n_indall_clean) <- c("pidp", "hidp", "imd2015qe_dv", "imd2019qe_dv", 
                           "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv",
                           "imd2014qw_dv", "imd2019qw_dv")
waven <- merge(waven, n_indall_clean, by = c("pidp", "hidp"), all.x = TRUE)

n_hhresp <- read_dta(paste0(base_path, "n_hhresp.dta"))
n_hhresp_clean <- n_hhresp[c("n_hidp", "n_fihhmnnet1_dv")]
names(n_hhresp_clean) <- c("hidp", "fihhmnnet1_dv ")
waven <- merge(waven, n_hhresp_clean, by = c("hidp"), all.x = TRUE)
waven$fihhmnnet1_dv=as.numeric(waven$fihhmnnet1_dv)



### keep only the variables of interest ###

library(dplyr)

# List of variables you want to keep
vars_to_keep <- c("pidp","hidp", "wave",  "intdaty_dv","age_dv", "ndinus_lw", "indpxus_lw", "indinub_xw", "indinui_xw", "inding2_xw", "scghq1_dv", "scghq2_dv", "sf1", "fihhmnnet3_dv", "hhtype_dv", "jbstat", "ncigs", "aepuwk", "frdrg", "bmi_dv", "sex", "nch14resp", "gor_dv", "racel_dv", "panssec8_dv", "manssec8_dv", "scisolate", "sclonely", "scend", "hiqual_dv", "health", "imd2015qe_dv", "imd2019qe_dv", "imd2017qni_dv", "imd2016qs_dv", "imd2020qs_dv","imd2014qw_dv", "imd2019qw_dv", "fihhmnnet1_dv", "hhtype_dv", "hcond1", "hcond4", "hcond5", "hcond8", "hcond10", "hcond11", "hcond12", "hcond13", "hcond14", "hcond15", "hcond16", "hconds01", "hconds04", "hconds05", "hconds08", "hconds10", "hconds11", "hconds12", "hconds13", "hconds14", "hconds15", "hconds16", "hcondns1", "hcondns4", "hcondns5", "hcondns8", "hcondns10", "hcondns11", "hcondns12", "hcondns13", "hcondns14", "hcondns15", "hcondns16","hcondn1", "hcondn4", "hcondn5", "hcondn8", "hcondn10", "hcondn11", "hcondn12", "hcondn13", "hcondn14", "hcondn15", "hcondn16", "hcondnew1",  "hcondnew3", "hcondnew4", "hcondnew5", "hcondnew8", "hcondnew10", "hcondnew11", "hcondnew12", "hcondnew13", "hcondnew14", "hcondnew15", "hcondnew16", "hcond17", "hcondn17", "hcondcode38", "hcondncode38")

# Function to add missing columns to a single wave
add_missing_cols <- function(df, all_vars) {
  missing_vars <- setdiff(all_vars, names(df))
  if(length(missing_vars) > 0) {
    df[missing_vars] <- NA
  }
  # Only keep the variables we care about
  return(df[, all_vars[all_vars %in% names(df)]])
}

# Apply to each wave and bind
data <- bind_rows(
  add_missing_cols(wavea, vars_to_keep),
  add_missing_cols(waveb, vars_to_keep),
  add_missing_cols(wavec, vars_to_keep),
  add_missing_cols(waved, vars_to_keep),
  add_missing_cols(wavee, vars_to_keep),
  add_missing_cols(wavef, vars_to_keep),
  add_missing_cols(waveg, vars_to_keep),
  add_missing_cols(waveh, vars_to_keep),
  add_missing_cols(wavei, vars_to_keep),
  add_missing_cols(wavej, vars_to_keep),
  add_missing_cols(wavek, vars_to_keep),
  add_missing_cols(wavel, vars_to_keep),
  add_missing_cols(wavem, vars_to_keep),
  add_missing_cols(waven, vars_to_keep)
)


### Recode health conditions: this is only on the first entry in the dataset (and then we impute next waves based on first entry, this is not updated at this stage) ###

### HCOND1= ASTHMA is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond1 = ifelse(wave == 2010, -8, hcond1)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond1 %in% c(0, 1), hcond1, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond1_final = case_when(
      hcond1 %in% c(0, 1) ~ hcond1,
      hcond1 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()
table(data$hcond1_final, data$wave)
###  problem, lots of people enter in wave 2010! ###

### HCOND4= CORONARY is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond4 = ifelse(wave == 2010, -8, hcond4)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond4 %in% c(0, 1), hcond4, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond4_final = case_when(
      hcond4 %in% c(0, 1) ~ hcond4,
      hcond4 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

### HCOND5= ANGINA is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond5 = ifelse(wave == 2010, -8, hcond5)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond5 %in% c(0, 1), hcond5, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond5_final = case_when(
      hcond5 %in% c(0, 1) ~ hcond5,
      hcond5 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

### HCOND8= EMPHYSEMA is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond8 = ifelse(wave == 2010, -8, hcond8)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond8 %in% c(0, 1), hcond8, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond8_final = case_when(
      hcond8 %in% c(0, 1) ~ hcond8,
      hcond8 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

### HCOND10= HYPOTIROIDISM is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond10 = ifelse(wave == 2010, -8, hcond10)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond10 %in% c(0, 1), hcond10, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond10_final = case_when(
      hcond10 %in% c(0, 1) ~ hcond10,
      hcond10 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

### HCOND11= CHRONIC BRONCHITIS is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond11 = ifelse(wave == 2010, -8, hcond11)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond11 %in% c(0, 1), hcond11, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond11_final = case_when(
      hcond11 %in% c(0, 1) ~ hcond11,
      hcond11 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

### HCOND12= ANY LIVER DISEASE is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond12 = ifelse(wave == 2010, -8, hcond12)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond1 %in% c(0, 1), hcond12, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond12_final = case_when(
      hcond12 %in% c(0, 1) ~ hcond12,
      hcond12 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

### HCOND13= CANCER is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond13 = ifelse(wave == 2010, -8, hcond13)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond1 %in% c(0, 1), hcond13, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond13_final = case_when(
      hcond13 %in% c(0, 1) ~ hcond13,
      hcond13 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

### HCOND14= DIABETES is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond14 = ifelse(wave == 2010, -8, hcond14)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond14 %in% c(0, 1), hcond14, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond14_final = case_when(
      hcond14 %in% c(0, 1) ~ hcond14,
      hcond14 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

### HCOND15= EPILEPSY is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond15 = ifelse(wave == 2010, -8, hcond15)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond15 %in% c(0, 1), hcond15, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond15_final = case_when(
      hcond15 %in% c(0, 1) ~ hcond15,
      hcond15 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()


### HCOND16= HIGH BLOOD PRESSURE is only asked to new entrants and coded -8 if not a new entrant, so we need to impute based on previous available values but with a gap (no data) in 2010 ###
library(dplyr)
data <- data %>%
  # Force 2010 to -8
  mutate(hcond16 = ifelse(wave == 2010, -8, hcond16)) %>%
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    valid_response = ifelse(hcond16 %in% c(0, 1), hcond16, NA),
    # This carries forward from the LAST valid response, skipping gaps
    valid_carried = zoo::na.locf(valid_response, na.rm = FALSE),
    hcond16_final = case_when(
      hcond16 %in% c(0, 1) ~ hcond16,
      hcond16 == -8 ~ valid_carried,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()


### Add information on newly diagnosed health condition for those who replied on previously diagnosed health condition when they entered the survey (so, no information at wave 2/2010) ###

library(dplyr)

### HCOND1 ###
data <- data %>%
  # Recode new diagnosis variables (only mark 1, everything else is not a new diagnosis)
  mutate(
    # hcondn1: waves 2010-2017
    hcondn1_binary = ifelse(wave %in% 2010:2017 & hcondn1 == 1, 1, 0),
    # hcondnew1: waves 2019-2022  
    hcondnew1_binary = ifelse(wave %in% 2019:2022 & hcondnew1 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn1_binary == 1 | hcondnew1_binary == 1, 1, 0)
  ) %>%
  
  # Create hcond1_total that adds new diagnosis info to hcond1_final
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond1_total = case_when(
      # If we have valid info from hcond1_final, use it (possibly updated by new diagnosis)
      !is.na(hcond1_final) & hcond1_final == 1 ~ 1,
      !is.na(hcond1_final) & hcond1_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond1_final) & hcond1_final == 0 & newly_diagnosed == 0 ~ 0,
      # If hcond1_final is NA, keep as NA (don't use new diagnosis info alone)
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn1_binary, -hcondnew1_binary, -newly_diagnosed)



### HCOND4 ###
data <- data %>%
  mutate(
    # hcondn4: waves 2010-2017
    hcondn4_binary = ifelse(wave %in% 2010:2017 & hcondn4 == 1, 1, 0),
    # hcondnew1: waves 2019-2022  
    hcondnew4_binary = ifelse(wave %in% 2019:2022 & hcondnew4 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn4_binary == 1 | hcondnew4_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond4_total = case_when(
      !is.na(hcond4_final) & hcond4_final == 1 ~ 1,
      !is.na(hcond4_final) & hcond4_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond4_final) & hcond4_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn4_binary, -hcondnew4_binary, -newly_diagnosed)


### HCOND5 ###
data <- data %>%
  mutate(
    # hcondn5: waves 2010-2017
    hcondn5_binary = ifelse(wave %in% 2010:2017 & hcondn5 == 1, 1, 0),
    # hcondnew1: waves 2019-2022  
    hcondnew5_binary = ifelse(wave %in% 2019:2022 & hcondnew5 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn5_binary == 1 | hcondnew5_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond5_total = case_when(
      !is.na(hcond5_final) & hcond5_final == 1 ~ 1,
      !is.na(hcond5_final) & hcond5_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond5_final) & hcond5_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn5_binary, -hcondnew5_binary, -newly_diagnosed)


### HCOND8 ###
data <- data %>%
  mutate(
    # hcondn8: waves 2010-2017
    hcondn8_binary = ifelse(wave %in% 2010:2017 & hcondn8 == 1, 1, 0),
    # hcondnew1: waves 2019-2022  
    hcondnew8_binary = ifelse(wave %in% 2019:2022 & hcondnew8 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn8_binary == 1 | hcondnew8_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond8_total = case_when(
      !is.na(hcond8_final) & hcond8_final == 1 ~ 1,
      !is.na(hcond8_final) & hcond8_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond8_final) & hcond8_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn8_binary, -hcondnew8_binary, -newly_diagnosed)


### HCOND10 ###
data <- data %>%
  mutate(
    # hcondn10: waves 2010-2017
    hcondn10_binary = ifelse(wave %in% 2010:2017 & hcondn10 == 1, 1, 0),
    # hcondnew1: waves 2019-2022  
    hcondnew10_binary = ifelse(wave %in% 2019:2022 & hcondnew10 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn10_binary == 1 | hcondnew10_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond10_total = case_when(
      !is.na(hcond10_final) & hcond10_final == 1 ~ 1,
      !is.na(hcond10_final) & hcond10_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond10_final) & hcond10_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn10_binary, -hcondnew10_binary, -newly_diagnosed)



### HCOND11 ###
data <- data %>%
  mutate(
    hcondn11_binary = ifelse(wave %in% 2010:2017 & hcondn11 == 1, 1, 0),
    hcondnew11_binary = ifelse(wave %in% 2019:2022 & hcondnew11 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn11_binary == 1 | hcondnew11_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond11_total = case_when(
      !is.na(hcond11_final) & hcond11_final == 1 ~ 1,
      !is.na(hcond11_final) & hcond11_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond11_final) & hcond11_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn11_binary, -hcondnew11_binary, -newly_diagnosed)



### HCOND12 ###
data <- data %>%
  mutate(
    hcondn12_binary = ifelse(wave %in% 2010:2017 & hcondn12 == 1, 1, 0),
    hcondnew12_binary = ifelse(wave %in% 2019:2022 & hcondnew12 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn12_binary == 1 | hcondnew12_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond12_total = case_when(
      !is.na(hcond12_final) & hcond12_final == 1 ~ 1,
      !is.na(hcond12_final) & hcond12_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond12_final) & hcond12_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn12_binary, -hcondnew12_binary, -newly_diagnosed)
### HCOND13 ###
data <- data %>%
  mutate(
    hcondn13_binary = ifelse(wave %in% 2010:2017 & hcondn13 == 1, 1, 0),
    hcondnew13_binary = ifelse(wave %in% 2019:2022 & hcondnew13 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn13_binary == 1 | hcondnew13_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond13_total = case_when(
      !is.na(hcond13_final) & hcond13_final == 1 ~ 1,
      !is.na(hcond13_final) & hcond13_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond13_final) & hcond13_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn13_binary, -hcondnew13_binary, -newly_diagnosed)


### HCOND14 ###
data <- data %>%
  mutate(
    hcondn14_binary = ifelse(wave %in% 2010:2017 & hcondn14 == 1, 1, 0),
    hcondnew14_binary = ifelse(wave %in% 2019:2022 & hcondnew14 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn14_binary == 1 | hcondnew14_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond14_total = case_when(
      !is.na(hcond14_final) & hcond14_final == 1 ~ 1,
      !is.na(hcond14_final) & hcond14_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond14_final) & hcond14_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn14_binary, -hcondnew14_binary, -newly_diagnosed)

### HCOND15 ###
data <- data %>%
  mutate(
    hcondn15_binary = ifelse(wave %in% 2010:2017 & hcondn15 == 1, 1, 0),
    hcondnew15_binary = ifelse(wave %in% 2019:2022 & hcondnew15 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn15_binary == 1 | hcondnew15_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond15_total = case_when(
      !is.na(hcond15_final) & hcond15_final == 1 ~ 1,
      !is.na(hcond15_final) & hcond15_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond15_final) & hcond15_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn15_binary, -hcondnew15_binary, -newly_diagnosed)


### HCOND16 ###
data <- data %>%
  mutate(
    hcondn16_binary = ifelse(wave %in% 2010:2017 & hcondn16 == 1, 1, 0),
    hcondnew16_binary = ifelse(wave %in% 2019:2022 & hcondnew16 == 1, 1, 0),
    # Combine into single new diagnosis indicator
    newly_diagnosed = ifelse(hcondn16_binary == 1 | hcondnew16_binary == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    hcond16_total = case_when(
      !is.na(hcond16_final) & hcond16_final == 1 ~ 1,
      !is.na(hcond16_final) & hcond16_final == 0 & newly_diagnosed == 1 ~ 1,  # New diagnosis updates 0 to 1
      !is.na(hcond16_final) & hcond16_final == 0 & newly_diagnosed == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-hcondn16_binary, -hcondnew16_binary, -newly_diagnosed)


### rename final as total: they all include first interview information + potential newly diagnosed conditions ###

data$hcond1_final= data$hcond1_total
data$hcond4_final= data$hcond4_total
data$hcond5_final= data$hcond5_total
data$hcond8_final= data$hcond8_total
data$hcond10_final= data$hcond10_total
data$hcond11_final= data$hcond11_total
data$hcond12_final= data$hcond12_total
data$hcond13_final= data$hcond13_total
data$hcond14_final= data$hcond14_total
data$hcond15_final= data$hcond15_total
data$hcond16_final= data$hcond16_total


### Now, code diagnosed depression cases ###

### hcond17= clinical depression, waves 1, 3-9 (not available at wave 2), only for new entrants ###

### hcondn17= newly diagnosed clinical depression, wave 2 to 9, for respondents who were already interviewed

### hcondcode38= depression waves 10 to 15, only for new entrants) 

### hcondncode38= no depression diagnosed, for respondents who were already interviewed ###

### in other words= HCOND17 for new entrants and HCONDN17 is a follow up on them. These are for waves 1 to 9. Then, we need to use other variables to cover waves 10 to 15 (HCONDCODE38 and HCONDNCODE38 ###

### code for this ###
### DEPRESSION (HCOND17) - Properly handling all four variables ###

library(dplyr)
library(zoo)

# Step 1: Create initial diagnosis variable from both hcond17 and hcondcode38
data <- data %>%
  mutate(
    # Create unified initial diagnosis from first interview
    depression_initial = case_when(
      # hcond17 available in: 2009, 2011-2017
      wave %in% c(2009, 2011:2017) & hcond17 %in% c(0, 1) ~ hcond17,
      # hcondcode38 available in: 2019-2022 (this is the NEW variable for new entrants)
      wave %in% 2019:2022 & hcondcode38 %in% c(0, 1) ~ hcondcode38,
      # Wave 2010 is a gap, so we'll fill it later
      wave == 2010 ~ NA_real_,
      TRUE ~ NA_real_
    )
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    # Carry forward from previous valid responses
    depression_carried = na.locf(depression_initial, na.rm = FALSE),
    # Carry backward to fill wave 2010 if needed
    depression_carried_back = na.locf(depression_carried, fromLast = TRUE, na.rm = FALSE),
    
    # Final version with both forward and backward filling
    depression_final = case_when(
      !is.na(depression_initial) ~ depression_initial,
      !is.na(depression_carried) ~ depression_carried,
      !is.na(depression_carried_back) ~ depression_carried_back,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

# Step 2: Add new diagnosis information from BOTH hcondn17 and hcondncode38
data <- data %>%
  mutate(
    # New diagnoses from hcondn17 (waves 2010-2017)
    depression_new_old = ifelse(wave %in% 2010:2017 & hcondn17 == 1, 1, 0),
    # New diagnoses from hcondncode38 (waves 2019-2022)  
    depression_new_new = ifelse(wave %in% 2019:2022 & hcondncode38 == 1, 1, 0),
    # Combined new diagnosis indicator
    depression_new_diagnosis = ifelse(depression_new_old == 1 | depression_new_new == 1, 1, 0)
  ) %>%
  
  group_by(pidp) %>%
  arrange(pidp, wave) %>%
  mutate(
    # Update depression_final with new diagnoses
    depression_final_updated = case_when(
      # If already has condition, stays 1
      depression_final == 1 ~ 1,
      # If new diagnosis, becomes 1 (this handles hcondn17 and hcondncode38)
      depression_final == 0 & depression_new_diagnosis == 1 ~ 1,
      # If no condition and no new diagnosis, stays 0
      depression_final == 0 & depression_new_diagnosis == 0 ~ 0,
      # For waves 2019-2022, also capture hcondcode38 directly 
      # (this handles new entrants in 2019+)
      wave %in% 2019:2022 & hcondcode38 == 1 ~ 1,
      wave %in% 2019:2022 & hcondcode38 == 0 ~ 0,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup() %>%
  # Remove temporary columns
  select(-depression_initial, -depression_carried, -depression_carried_back,
         -depression_new_old, -depression_new_new, -depression_new_diagnosis)

# Step 3: Rename to match your convention
data$hcond17_final <- data$depression_final_updated
data <- data %>% select(-depression_final_updated)

# Check distribution to verify
table(data$hcond17_final, data$wave)








# Create condition count

data$condition_count <- rowSums(data[, c("hcond1_final", "hcond4_final", "hcond5_final", 
                                         "hcond8_final", "hcond10_final", "hcond11_final", 
                                         "hcond12_final", "hcond13_final", "hcond14_final", 
                                         "hcond15_final", "hcond16_final", "hcond17_final")] == 1, na.rm = FALSE)

# Create multimorbidity variable with four modalities (0, 1, 2, 3 and above)
data$multimorbidity <- ifelse(data$condition_count == 0, 0,
                              ifelse(data$condition_count == 1, 1,
                                     ifelse(data$condition_count == 2, 2, 3)))

### note that the multimorbidity is largely increased by asthma ###

### alternative multimorbidity measure without asthma ###
data$condition_count_withoutasthma <- rowSums(data[, c("hcond4_final", "hcond5_final", 
                                                       "hcond8_final", "hcond10_final", "hcond11_final", 
                                                       "hcond12_final", "hcond13_final", "hcond14_final", 
                                                       "hcond15_final", "hcond16_final", "hcond17_final")] == 1, na.rm = TRUE)

# Create multimorbidity variable with four modalities (0, 1, 2, 3 and above)
data$multimorbidity_withoutasthma <- ifelse(data$condition_count_withoutasthma == 0, 0,
                                            ifelse(data$condition_count_withoutasthma == 1, 1,
                                                   ifelse(data$condition_count_withoutasthma == 2, 2, 3)))

### at least one condition (including asthma) ###
data$atleastonecondition <- ifelse(data$condition_count >= 1, 1, 0)

## table for proportions per year ###
# Create contingency table
multimorb_table <- table(data$multimorbidity, data$wave)

# Calculate percentages by wave (column percentages)
percent_by_wave <- prop.table(multimorb_table, margin = 2) * 100

# View with rounded percentages
round(percent_by_wave, 1)




### recode variables ### 

### NEET ###
data$NEET <- ifelse(data$jbstat %in% c(3, 8, 97), 1, 0)
### note on the definition of NEET here: ###
### We created the NEET variable by coding it as 1 when the person is not in education, employment or training, and 0 when they are. NEET is coded as 1 for individuals who are unemployed (code 3), long-term sick or disabled (code 8), or doing something else (code 97). NEET is coded as 0 for all other employment statuses including self-employed, paid employment, retired, on maternity leave, family care, full-time student, government training schemes, unpaid family business, apprenticeships, furlough, temporary layoffs, and parental or adoption leave.###

### SEX ###
data$sex <- as.character(data$sex)
data$sex[data$sex == "1"] <- "Male"
data$sex[data$sex == "2"] <- "Female"
data$sex[data$sex == "-9"] <- NA
data$sex[data$sex == "-2"] <- NA
data$sex=as.factor(data$sex)
data$sex <- relevel(data$sex, ref = "Male")

### Year ###
data$year=as.numeric(data$intdaty_dv)
### subset year 2024 because too few observations ###
data <- subset(data, year != 2024)

### Year – two periods for BOK ###
data$yearbi <- as.numeric(data$year)
data$yearbi[data$yearbi <= 2016] <- 0
data$yearbi[data$yearbi > "2016"] <- 1


### health condition or disability (binary) ###
data$health_binary <- NA  
data$health_binary[data$health == 1] <- 1    # Has condition
data$health_binary[data$health == 2] <- 0    # No condition
data$health_binary <- factor(data$health_binary,
                             levels = c(0, 1),
                             labels = c("No condition", "Has condition"))
data$health_binary <- relevel(factor(data$health_binary), ref = "No condition")

### child/children responsibility ### 
data$child_resp <- NA  
data$child_resp[data$nch14resp== 0] <- 0 
data$child_resp[data$nch14resp== 1] <- 1    
data$child_resp[data$nch14resp== 2] <- 1    
data$child_resp[data$nch14resp== 3] <- 1    
data$child_resp[data$nch14resp== 4] <- 1    
data$child_resp[data$nch14resp== 5] <- 1    
data$child_resp[data$nch14resp== 6] <- 1    
data$child_resp <- factor(data$child_resp,
                          levels = c(0, 1),
                          labels = c("No child responsibility", "Child-ren responsibility"))
data$child_resp <- relevel(factor(data$child_resp), ref = "No child responsibility")

### weights (cross-sectional) ###
data$weight_combined <- NA
# weights based on wave years
data$weight_combined[data$wave >= 2010 & data$wave <= 2014] <- 
  data$indinub_xw[data$wave >= 2010 & data$wave <= 2014]
data$weight_combined[data$wave >= 2015 & data$wave <= 2021] <- 
  data$indinui_xw[data$wave >= 2015 & data$wave <= 2021]
data$weight_combined[data$wave >= 2022 & data$wave <= 2023] <- 
  data$inding2_xw[data$wave >= 2022 & data$wave <= 2023]
# Set weights for 2009 to 1
data$weight_combined[data$wave == 2009] <- 1
data$weight=data$weight_combined

### Equivalized Household Incomes ###
### Equivalized income=1+0.5×(adults−1)+0.3×childrenHousehold income
# Load dplyr for data manipulation (or use base R)
library(dplyr)

data$fihhmnnet1_dv[data$fihhmnnet1_dv== -1] <- NA
data$fihhmnnet1_dv[data$fihhmnnet1_dv== -1] <- NA
data$fihhmnnet1_dv[data$fihhmnnet1_dv== -2] <- NA
data$fihhmnnet1_dv[data$fihhmnnet1_dv== -3] <- NA
data$fihhmnnet1_dv[data$fihhmnnet1_dv== -9] <- NA


# Create a lookup table for hhtype_dv -> adults and children
# (Assumptions: for ranges, we take the lower bound)
hhtype_map <- tibble::tribble(
  ~hhtype, ~adults, ~children, ~note,
  -9, NA, NA, "missing",
  -8, NA, NA, "inapplicable",
  -2, NA, NA, "refusal",
  -1, NA, NA, "don't know",
  1,  1, 0, "1 male 65+",
  2,  1, 0, "1 female 60+",
  3,  1, 0, "1 adult < pension age",
  4,  1, 1, "1 adult, 1 child",
  5,  1, 2, "1 adult, 2+ children (assume 2)",
  6,  2, 0, "couple both < pension age",
  8,  2, 0, "couple 1+ > pension age",
  10, 2, 1, "couple, 1 child",
  11, 2, 2, "couple, 2 children",
  12, 2, 3, "couple, 3+ children (assume 3)",
  16, 2, 0, "2 adults non-couple, both < pension age",
  17, 2, 0, "2 adults non-couple, 1+ > pension age",
  18, 2, 1, "2 adults non-couple, 1+ children (assume 1)",
  19, 3, 0, "3+ adults, no children, with couple (assume 3 adults)",
  20, 3, 2, "3+ adults, 1-2 children, with couple (assume 3 adults, 2 children)",
  21, 3, 3, "3+ adults, >2 children, with couple (assume 3 adults, 3 children)",
  22, 3, 0, "3+ adults, no children, no couple (assume 3 adults)",
  23, 3, 1, "3+ adults, 1+ children, no couple (assume 3 adults, 1 child)"
)

# Merge the map with your data
data <- data %>%
  left_join(hhtype_map, by = c("hhtype_dv" = "hhtype"))

# Compute equivalence factor and equivalized income
data <- data %>%
  mutate(
    # OECD modified scale factor
    eq_factor = 1 + 0.5 * (adults - 1) + 0.3 * children,
    # Equivalized household income
    eq_income = fihhmnnet1_dv / eq_factor
  )

# check distribution
summary(data$eq_income)

# Calculate equivalized income quintiles per year
data <- data %>%
  group_by(year) %>%  
  mutate(eq_income_q = dplyr::ntile(eq_income, 5)) %>%
  ungroup()

### highest level of education ###
data$educ=as.numeric(data$hiqual_dv)
data$educ[data$educ == "9"] <- "No qualification"
data$educ[data$educ == "3"] <- "A-level"
data$educ[data$educ == "4"] <- "GCSE "
data$educ[data$educ == "1"] <- "Degree "
data$educ[data$educ == "2"] <- "Other higher degree"
data$educ[data$educ == "5"] <- "Other qualification"
data$educ[data$educ == "-8"] <- "Other qualification"
data$educ[data$educ == "-9"] <- "Other qualification"

### Education with GCSE or below (0) vs above (1) ###
data$educbi=as.numeric(data$hiqual_dv)
data$educbi[data$educbi == "9"] <- "0"
data$educbi[data$educbi == "3"] <- "1"
data$educbi[data$educbi == "4"] <- "0"
data$educbi[data$educbi == "1"] <- "1"
data$educbi[data$educbi == "2"] <- "1"
data$educbi[data$educbi == "5"] <- "1"
data$educbi[data$educbi == "-8"] <- NA
data$educbi[data$educbi == "-9"] <- NA


### region ###
data$region=as.numeric(data$gor_dv)
data$region[data$region == "12"] <- "NI"
data$region[data$region == "10"] <- "Wales"
data$region[data$region == "11"] <- "Scotland"
data$region[data$region == "7"] <- "London and South of England"
data$region[data$region == "8"] <- "London and South of England"
data$region[data$region == "9"] <- "London and South of England"
data$region[data$region == "1"] <- "Midlands and North of England"
data$region[data$region == "2"] <- "Midlands and North of England"
data$region[data$region == "3"] <- "Midlands and North of England"
data$region[data$region == "4"] <- "Midlands and North of England"
data$region[data$region == "5"] <- "Midlands and North of England"
data$region[data$region == "6"] <- "Midlands and North of England"
data$region[data$region == "-9"] <- NA
data$region=as.factor(data$region)
data$region <- relevel(data$region, ref = "London and South of England")


#### ethnicity (white British vs non-white) ###
data$ethn=as.numeric(data$racel_dv)
data$ethn[data$ethn == "-9"] <- NA
data$ethn[data$ethn >=5] <- "Non white"
data$ethn[data$ethn == "1"] <- "White"
data$ethn[data$ethn == "2"] <- "White"
data$ethn[data$ethn == "3"] <- "White"
data$ethn[data$ethn == "4"] <- "White"

### GHQ caseness with cut point 4 or more ###
data$GHQcas=as.numeric(data$scghq2_dv)
data$GHQcas[data$GHQcas == -9] <- NA
data$GHQcas[data$GHQcas == -8] <- NA
data$GHQcas[data$GHQcas == -7] <- NA
data$GHQcas[data$GHQcas == "0"] <- 0
data$GHQcas[data$GHQcas == "1"] <- 0
data$GHQcas[data$GHQcas == "2"] <- 0
data$GHQcas[data$GHQcas == "3"] <- 0
data$GHQcas[data$GHQcas == "4"] <- 1
data$GHQcas[data$GHQcas == "5"] <- 1
data$GHQcas[data$GHQcas == "6"] <- 1
data$GHQcas[data$GHQcas == "7"] <- 1
data$GHQcas[data$GHQcas == "8"] <- 1
data$GHQcas[data$GHQcas == "9"] <- 1
data$GHQcas[data$GHQcas == "10"] <- 1
data$GHQcas[data$GHQcas == "11"] <- 1
data$GHQcas[data$GHQcas == "12"] <- 1
### harmonized IMD ###

library(dplyr)

data <- data %>%
  mutate(
    IMD = case_when(
      imd2014qw_dv != -8 ~ imd2014qw_dv,  # England IMD
      imd2015qe_dv != -8 ~ imd2015qe_dv,  # Wales IMD
      imd2016qs_dv != -8 ~ imd2016qs_dv,  # Scotland IMD
      imd2017qni_dv != -8 ~ imd2017qni_dv, # Northern Ireland IMD
      TRUE ~ -8  # Keep -8 if all are -8 (shouldn't happen if location is valid)
    )
  )

table(data$year, data$IMD)

### code -8 as NA and pick up 1 as reference ###
data$IMD[data$IMD == "-8"] <- NA
data$IMD=as.factor(data$IMD)
data$IMD <- relevel(data$IMD, ref = "1")

### note: 1 is most deprived 20% ###



### calculate the OR of the relationship between multimorbidity and health conditions ###

library(survey)

survey_design <- svydesign(ids = ~1, weights = ~weight_combined, data = data)

# Compare each multimorbidity group to reference (e.g., group 0)
# First, relevel multimorbidity with 0 as reference
data$multimorbidity_ref <- relevel(factor(data$multimorbidity), ref = "0")
survey_design <- svydesign(ids = ~1, weights = ~weight_combined, data = data)

# Logistic regression for odds ratios
model <- svyglm(health_binary ~ multimorbidity_ref, 
                design = survey_design, 
                family = quasibinomial())

# Get odds ratios with confidence intervals
summary_model <- summary(model)
odds_ratios <- exp(coef(model))
ci <- exp(confint(model))

# View results
odds_ratios_df <- data.frame(
  comparison = names(odds_ratios)[-1],  # exclude intercept
  OR = round(odds_ratios[-1], 2),
  CI_lower = round(ci[-1, 1], 2),
  CI_upper = round(ci[-1, 2], 2),
  p_value = round(summary_model$coefficients[-1, 4], 4)
)
print(odds_ratios_df)












### plot for probabilities from modified Poisson regression and prevalence by groups ###

# Modified Poisson regression for risk ratios
library(sandwich)
library(lmtest)
library(ggplot2)
library(ggeffects)
library(ggthemes) 

options(scipen = 999)

### year as factor ###
data$year=as.factor(data$year)
data$year <- relevel(data$year, ref = "2009")
### note: 2016 is the exact cut point ###





# stacked bar plots with aligned percentage labels
# Bars sum to predicted NEET/non-NEET rate (not 100%)

library(ggplot2)
library(dplyr)
library(scales)
library(sandwich)
library(tidyr)
library(patchwork)

options(scipen = 999)

#  Prepare data 
data$year_numeric <- as.numeric(as.character(data$year))
data_filtered <- data %>% filter(year_numeric >= 2009)

# NEET categories 
data_filtered$neet_category <- factor(
  dplyr::case_when(
    data_filtered$jbstat == 3  ~ "Unemployed",
    data_filtered$jbstat == 8  ~ "Long-term sick/disabled",
    data_filtered$jbstat == 97 ~ "Other NEET",
    TRUE ~ NA_character_
  ),
  levels = c("Unemployed", "Long-term sick/disabled", "Other NEET")
)

#  Non‑NEET categories
data_filtered$nonneet_category <- factor(
  dplyr::case_when(
    data_filtered$jbstat %in% c(1,2,10)      ~ "Employed",
    data_filtered$jbstat %in% c(7,9,11)      ~ "Education or training",
    data_filtered$jbstat %in% c(4,5,6,98,12) ~ "Inactive (not NEET)",
    TRUE ~ NA_character_
  ),
  levels = c("Employed", "Education or training", "Inactive (not NEET)")
)

#  Within‑group proportions (sum to 1)
props_neet_within <- data_filtered %>%
  filter(!is.na(neet_category)) %>%
  group_by(year_numeric, neet_category) %>%
  summarise(w = sum(weight, na.rm=TRUE), .groups="drop") %>%
  group_by(year_numeric) %>%
  mutate(prop_within = w / sum(w)) %>%
  ungroup() %>%
  rename(year = year_numeric)

props_nonneet_within <- data_filtered %>%
  filter(!is.na(nonneet_category)) %>%
  group_by(year_numeric, nonneet_category) %>%
  summarise(w = sum(weight, na.rm=TRUE), .groups="drop") %>%
  group_by(year_numeric) %>%
  mutate(prop_within = w / sum(w)) %>%
  ungroup() %>%
  rename(year = year_numeric)

# Modified Poisson for NEET
model_neet <- glm(NEET ~ as.factor(year), 
                  data = data_filtered, 
                  weights = weight, 
                  family = poisson(link="log"))
robust_vcov_neet <- vcovHC(model_neet, type = "HC0")
year_levels <- sort(unique(data_filtered$year_numeric))
coefs_neet <- coef(model_neet)

get_pred <- function(year_val, coefs, vcov_mat, ref_year = min(year_levels)) {
  X <- rep(0, length(coefs))
  X[1] <- 1
  if(year_val != ref_year) {
    X[which(year_levels == year_val)] <- 1
  }
  log_pred <- sum(X * coefs)
  se_log <- sqrt(t(X) %*% vcov_mat %*% X)
  return(c(prob = exp(log_pred),
           ci_lower = exp(log_pred - 1.96*se_log),
           ci_upper = exp(log_pred + 1.96*se_log)))
}

pred_neet <- data.frame(year = year_levels,
                        t(sapply(year_levels, get_pred, coefs_neet, robust_vcov_neet)))

#  Modified Poisson for non‑NEET 
data_filtered$nonNEET <- 1 - data_filtered$NEET
model_nonneet <- glm(nonNEET ~ as.factor(year), 
                     data = data_filtered, 
                     weights = weight, 
                     family = poisson(link="log"))
robust_vcov_nonneet <- vcovHC(model_nonneet, type = "HC0")
coefs_nonneet <- coef(model_nonneet)
pred_nonneet <- data.frame(year = year_levels,
                           t(sapply(year_levels, get_pred, coefs_nonneet, robust_vcov_nonneet)))

# ---------- Absolute contributions ----------
neet_abs <- props_neet_within %>%
  left_join(pred_neet, by="year") %>%
  mutate(abs_contrib = prob * prop_within)

nonneet_abs <- props_nonneet_within %>%
  left_join(pred_nonneet, by="year") %>%
  mutate(abs_contrib = prob * prop_within)

# ---------- Colours ----------
neet_colours <- c(
  "Unemployed"                = "#D4E6F1",   # strong blue
  "Long-term sick/disabled"   = "#7FB3D5",   # pale blue
  "Other NEET"                = "#2E86C1"    # very light blue
)

nonneet_colours <- c(
  "Employed"                  = "#D4E6F1",   # red
  "Education or training"     = "#7FB3D5",   # orange
  "Inactive (not NEET)"       = "#2E86C1"    # pale orange
)

# PLOT A: NEET, stacked bars with auto‑centered labels

FIGA_bars <- ggplot(neet_abs, aes(x = year, y = abs_contrib, fill = neet_category)) +
  geom_col(width = 0.9, color = "white", linewidth = 0.2) +
  geom_text(aes(label = percent(abs_contrib, accuracy = 0.1)),
            position = position_stack(vjust = 0.5), size = 2, color = "black") +
  geom_point(data = pred_neet, aes(x = year, y = prob),
             color = "#1A1A1A", size = 2.8, shape = 18, inherit.aes = FALSE) +
  geom_errorbar(data = pred_neet, aes(x = year, ymin = ci_lower, ymax = ci_upper),
                width = 0.3, color = "#1A1A1A", linewidth = 0.7, inherit.aes = FALSE) +
  geom_line(data = pred_neet, aes(x = year, y = prob),
            color = "#1A1A1A", linewidth = 0.5, alpha = 0.7, inherit.aes = FALSE) +
  annotate("rect", xmin = 2008.5, xmax = 2013.5, ymin = 0, ymax = max(pred_neet$ci_upper)*1.05, 
           fill = "#7F8C8D", alpha = 0.08) +
  annotate("rect", xmin = 2018.5, xmax = 2023.5, ymin = 0, ymax = max(pred_neet$ci_upper)*1.05, 
           fill = "#7F8C8D", alpha = 0.08) +
  annotate("text", x = 2011.5, y = max(pred_neet$ci_upper)*0.95, label = "Period I", 
           size = 2.8, family = "serif", color = "#7F8C8D", alpha = 0.8, lineheight = 0.9, fontface = "italic") +
  annotate("text", x = 2021, y = max(pred_neet$ci_upper)*0.95, label = "Period II", 
           size = 2.8, family = "serif", color = "#7F8C8D", alpha = 0.8, lineheight = 0.9, fontface = "italic") +
  scale_y_continuous(labels = percent_format(accuracy = 0.5), expand = c(0,0),
                     breaks = seq(0, 0.17, by = 0.02),
                     limits = c(0, max(pred_neet$ci_upper)*1.05),
                     name = "Absolute proportion of total population") +
  scale_x_continuous(breaks = seq(2009, 2023, by = 2),
                     limits = c(2008.5, 2023.5), expand = c(0,0)) +
  scale_fill_manual(values = neet_colours, name = NULL) +
  theme_classic(base_size = 10.5) +
  theme(
    text = element_text(family = "serif"),
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10)),
    legend.position = "bottom",
    panel.grid.major.y = element_line(color = "#E8E8E8", linewidth = 0.25)
  ) +
  labs(title = "NEET rate and composition (stacked bars)",
       x = "Calendar year", y = NULL,
       caption = "Each bar segment shows the absolute % of total population.")

# PLOT B: Non‑NEET – stacked bars with auto‑centered labels

FIGB_bars <- ggplot(nonneet_abs, aes(x = year, y = abs_contrib, fill = nonneet_category)) +
  geom_col(width = 0.9, color = "white", linewidth = 0.2) +
  geom_text(aes(label = percent(abs_contrib, accuracy = 0.1)),
            position = position_stack(vjust = 0.5), size = 2, color = "black") +
  geom_point(data = pred_nonneet, aes(x = year, y = prob),
             color = "#1A1A1A", size = 2.8, shape = 18, inherit.aes = FALSE) +
  geom_errorbar(data = pred_nonneet, aes(x = year, ymin = ci_lower, ymax = ci_upper),
                width = 0.3, color = "#1A1A1A", linewidth = 0.7, inherit.aes = FALSE) +
  geom_line(data = pred_nonneet, aes(x = year, y = prob),
            color = "#1A1A1A", linewidth = 0.5, alpha = 0.7, inherit.aes = FALSE) +
  annotate("rect", xmin = 2008.5, xmax = 2013.5, ymin = 0, ymax = 1, 
           fill = "#7F8C8D", alpha = 0.08) +
  annotate("rect", xmin = 2018.5, xmax = 2023.5, ymin = 0, ymax = 1, 
           fill = "#7F8C8D", alpha = 0.08) +
  annotate("text", x = 2011.5, y = 0.95, label = "Period I", 
           size = 2.8, family = "serif", color = "#7F8C8D", alpha = 0.8, lineheight = 0.9, fontface = "italic") +
  annotate("text", x = 2021, y = 0.95, label = "Period II", 
           size = 2.8, family = "serif", color = "#7F8C8D", alpha = 0.8, lineheight = 0.9, fontface = "italic") +
  scale_y_continuous(labels = percent_format(accuracy = 1), expand = c(0,0),
                     breaks = seq(0, 1, by = 0.1),
                     limits = c(0, 1),
                     name = "Absolute proportion of total population") +
  scale_x_continuous(breaks = seq(2009, 2023, by = 2),
                     limits = c(2008.5, 2023.5), expand = c(0,0)) +
  scale_fill_manual(values = nonneet_colours, name = NULL) +
  theme_classic(base_size = 10.5) +
  theme(
    text = element_text(family = "serif"),
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10)),
    legend.position = "bottom",
    panel.grid.major.y = element_line(color = "#E8E8E8", linewidth = 0.25)
  ) +
  labs(title = "Non-NEET rate and composition (stacked bars)",
       x = "Calendar year", y = NULL,
       caption = "Each bar segment shows the absolute % of total population.")


library(patchwork)

FIGA_bars + FIGB_bars











### Modified Poisson Regression###

# Modified Poisson regression for risk ratios
library(sandwich)
library(lmtest)
library(ggplot2)
library(ggeffects)
library(ggthemes) 

options(scipen = 999)

### year as factor ###
data$year=as.factor(data$year)
data$year <- relevel(data$year, ref = "2009")
### note: 2016 is the exact cut point ###




### NEW PLOT ###

# Load required libraries
library(ggplot2)
library(tidyr)
library(sandwich)
library(patchwork)
library(ggpubr)


lancet_theme <- function() {
  theme_minimal(base_family = "Times") +
    theme(
      text = element_text(color = "#2C2C2C", size = 8),
      plot.title = element_text(size = 8, hjust = 0, 
                                margin = margin(b = 8, t = 4)),
      axis.title = element_text(size = 6, color = "#2C2C2C"),
      axis.text = element_text(size = 6, color = "#5C5C5C"),
      axis.line = element_line(color = "#2C2C2C", linewidth = 0.3),
      axis.ticks = element_line(color = "#2C2C2C", linewidth = 0.3),
      axis.ticks.length = unit(0.15, "cm"),
      panel.grid.major = element_line(color = "#E5E5E5", linewidth = 0.2),
      panel.grid.minor = element_blank(),
      legend.position = "bottom",
      legend.title = element_blank(),
      legend.text = element_text(size = 7),
      legend.key.size = unit(0.3, "cm"),
      legend.margin = margin(t = -4, b = 2),
      plot.margin = margin(t = 8, r = 8, b = 8, l = 8)
    )
}

# Define the master function (IDENTICAL to yours, just added + lancet_theme() at the end)
create_plot <- function(data, var_name, var_label_ref, var_label_interest, 
                        prev_ylim = c(-2, 70), rr_breaks = seq(0, 5, 0.5)) {
  
  # Get unique years
  years <- unique(data$year)
  results <- data.frame()
  
  # Run Poisson models for each year
  for(y in years){
    # Subset data for this year
    data_subset <- subset(data, year == y)
    
    # Create formula dynamically
    formula_text <- as.formula(paste("NEET ~", var_name))
    
    m <- glm(formula_text, 
             data = data_subset, 
             weights = weight, 
             family = poisson(link = "log"))
    s <- sqrt(diag(sandwich::vcovHC(m, type = "HC0")))[2]
    results <- rbind(results, data.frame(
      year = y,
      rr = exp(coef(m)[2]),
      lower = exp(coef(m)[2] - 1.96*s),
      upper = exp(coef(m)[2] + 1.96*s)
    ))
  }
  
  # Calculate prevalence
  prev_data <- aggregate(weight ~ year + data[[var_name]], data = data, FUN = sum)
  names(prev_data) <- c("year", "group", "weight")
  prev_wide <- pivot_wider(prev_data, names_from = group, values_from = weight)
  
  # Use provided labels
  ref_cat <- var_label_ref
  cat_of_interest <- var_label_interest
  
  # Get column names
  col_names <- names(prev_wide)
  ref_col <- col_names[col_names %in% c(ref_cat, as.character(ref_cat))][1]
  interest_col <- col_names[col_names %in% c(cat_of_interest, as.character(cat_of_interest))][1]
  
  prev_wide$prevalence <- prev_wide[[interest_col]] / (prev_wide[[ref_col]] + prev_wide[[interest_col]]) * 100
  prev_wide$total <- prev_wide[[ref_col]] + prev_wide[[interest_col]]
  prev_wide$prevalence_se <- sqrt(prev_wide$prevalence/100 * (1 - prev_wide$prevalence/100) / prev_wide$total) * 100
  prev_wide$prevalence_lower <- prev_wide$prevalence - 1.96 * prev_wide$prevalence_se
  prev_wide$prevalence_upper <- prev_wide$prevalence + 1.96 * prev_wide$prevalence_se
  
  # Merge data
  plot_data <- merge(results, prev_wide[,c("year","prevalence","prevalence_lower","prevalence_upper")], by = "year")
  plot_data$year <- as.numeric(as.character(plot_data$year))
  
  # Dynamic transformation based on actual RR values
  rr_min <- min(plot_data$lower, na.rm = TRUE)
  rr_max <- max(plot_data$upper, na.rm = TRUE)
  
  # Add 10% padding
  rr_range <- rr_max - rr_min
  rr_min_pad <- rr_min - 0.05 * rr_range
  rr_max_pad <- rr_max + 0.05 * rr_range
  
  # Transformation functions specific to this plot
  transform_rr_local <- function(rr) {
    prev_min <- prev_ylim[1]
    prev_max <- prev_ylim[2]
    prev_min + (rr - rr_min_pad) * ((prev_max - prev_min) / (rr_max_pad - rr_min_pad))
  }
  
  inverse_transform_local <- function(y) {
    prev_min <- prev_ylim[1]
    prev_max <- prev_ylim[2]
    rr_min_pad + (y - prev_min) * ((rr_max_pad - rr_min_pad) / (prev_max - prev_min))
  }
  
  # Create plot with modified labels
  p <- ggplot(plot_data, aes(x = year)) + 
    # Prevalence bars with thin black border
    geom_bar(aes(y = prevalence, fill = "Prevalence"), stat = "identity", alpha = 0.6, width = 0.6, color = "#4A4A4A", linewidth = 0.2) + 
    geom_errorbar(aes(ymin = prevalence_lower, ymax = prevalence_upper), width = 0.2, linewidth = 0.25, color = "#6B8E9B") + 
    # RR line - thinner and more elegant
    geom_line(aes(y = transform_rr_local(rr), color = "RR"), linewidth = 0.3, alpha = 0.85) + 
    # RR points - smaller size
    geom_point(aes(y = transform_rr_local(rr), color = "RR"), size = 0.8, alpha = 0.85) + 
    # RR error bars - thinner
    geom_errorbar(aes(ymin = transform_rr_local(lower), ymax = transform_rr_local(upper), color = "RR"), 
                  width = 0.2, linewidth = 0.25) + 
    scale_y_continuous(name = "Proportion",
                       sec.axis = sec_axis(~inverse_transform_local(.), 
                                           name = "Prevalence Ratio",
                                           breaks = rr_breaks)) + 
    scale_x_continuous(breaks = seq(2009, 2023, by = 4)) + 
    # Less flashy colors - Lancet style
    scale_fill_manual(values = c("Prevalence" = "#9FB7C9"), name = "") + 
    scale_color_manual(values = c("RR" = "#A23B2C"), name = "") + 
    labs(x = NULL, title = paste0(cat_of_interest, " vs. ", ref_cat)) + 
    coord_cartesian(ylim = prev_ylim) + 
    lancet_theme() +  # <--- ONLY CHANGE: Added Lancet theme
    theme(axis.title.x = element_blank())
  
  return(p)
}

# Create all recoded variables first 
data$income_recoded <- factor(ifelse(data$eq_income_q == 1, "Lowest quintile", "Other quintiles"),
                              levels = c("Other quintiles", "Lowest quintile"))

data$educbi_recoded <- factor(ifelse(data$educbi == 1, "Above GCSE", "GCSE maximum"),
                              levels = c("Above GCSE", "GCSE maximum"))

data$region_recoded <- factor(ifelse(data$region == "London and South of England", "London & South", "Other regions"),
                              levels = c("Other regions", "London & South"))

data$ethn_recoded <- factor(ifelse(data$ethn == "White", "White", "Non white"),
                            levels = c("White", "Non white"))

data$GHQ_recoded <- factor(ifelse(data$GHQcas == 0, "No distress", "Psychological distress"),
                           levels = c("No distress", "Psychological distress"))

data$IMD_recoded <- factor(ifelse(data$IMD == 1, "Most deprived", "Less deprived"),
                           levels = c("Less deprived", "Most deprived"))

data$bicount <- factor(ifelse(data$condition_count >= 2, ">= 2 conditions", "< 2 conditions"),
                       levels = c("< 2 conditions", ">= 2 conditions"))

data$Asthma <- factor(ifelse(data$hcond1_final == 1, "Asthma", "No Asthma"),
                      levels = c("No Asthma", "Asthma"))

data$Depression <- factor(ifelse(data$hcond17_final == 1, "Depression", "No depression"),
                          levels = c("No depression", "Depression"))

data$Diabetes <- factor(ifelse(data$hcond14_final == 1, "Diabetes", "No Diabetes"),
                        levels = c("No Diabetes", "Diabetes"))

data$Epilepsy <- factor(ifelse(data$hcond15_final == 1, "Epilepsy", "No epilepsy"),
                        levels = c("No epilepsy", "Epilepsy"))

data$Blood <- as.factor(data$hcond16_final)
levels(data$Blood) <- c("Normal", "High blood pressure")

data$agebi <- factor(ifelse(data$age_dv %in% c(16, 17), "16-17", "18-24"),
                     levels = c("18-24", "16-17"))

data$chil <- factor(data$child_resp, 
                    levels = c("No child responsibility", "Child-ren responsibility"),
                    labels = c("None", "Child-ren responsibility"))

# Now create each plot
cat("Creating plot B: Sex\n")
PLOTB <- create_plot(data, "sex", "Male", "Female", 
                     prev_ylim = c(-2, 70), rr_breaks = seq(0, 5, 0.5))

cat("Creating plot C: Health condition\n")
PLOTC <- create_plot(data, "health_binary", "No condition", "Has condition",
                     prev_ylim = c(-2, 25), rr_breaks = seq(1, 4, 1))

cat("Creating plot D: Child responsibility\n")
PLOTD <- create_plot(data, "chil", "None", "Child-ren responsibility",
                     prev_ylim = c(-2, 25), rr_breaks = seq(1, 4, 1))

cat("Creating plot E: Income\n")
PLOTE <- create_plot(data, "income_recoded", "Other quintiles", "Lowest quintile",
                     prev_ylim = c(-2, 35), rr_breaks = seq(1, 4, 1))

cat("Creating plot F: Education\n")
PLOTF <- create_plot(data, "educbi_recoded", "Above GCSE", "GCSE maximum",
                     prev_ylim = c(-2, 60), rr_breaks = seq(0, 4, 0.5))

cat("Creating plot G: Region\n")
PLOTG <- create_plot(data, "region_recoded", "Other regions", "London & South",
                     prev_ylim = c(-2, 70), rr_breaks = seq(0, 3, 0.25))

cat("Creating plot H: Ethnicity\n")
PLOTH <- create_plot(data, "ethn_recoded", "White", "Non white",
                     prev_ylim = c(-2, 50), rr_breaks = seq(0, 4, 0.5))

cat("Creating plot I: GHQ distress\n")
PLOTI <- create_plot(data, "GHQ_recoded", "No distress", "Psychological distress",
                     prev_ylim = c(-2, 50), rr_breaks = seq(0, 4, 1))

cat("Creating plot J: IMD deprivation\n")
PLOTJ <- create_plot(data, "IMD_recoded", "Less deprived", "Most deprived",
                     prev_ylim = c(-2, 45), rr_breaks = seq(0, 4, 0.5))

cat("Creating plot K: Multimorbidity\n")
PLOTK <- create_plot(data, "bicount", "< 2 conditions", ">= 2 conditions",
                     prev_ylim = c(-2, 20), rr_breaks = seq(0, 6, 1))

cat("Creating plot L: Asthma\n")
PLOTL <- create_plot(data, "Asthma", "No Asthma", "Asthma",
                     prev_ylim = c(-2, 30), rr_breaks = seq(0, 4, 0.5))

cat("Creating plot M: Hypothyroidism\n")
PLOTM <- create_plot(data, "Depression", "No depression", "Depression",
                     prev_ylim = c(-2, 30), rr_breaks = seq(0, 8, 1))

cat("Creating plot N: Diabetes\n")
PLOTN <- create_plot(data, "Diabetes", "No Diabetes", "Diabetes",
                     prev_ylim = c(-2, 30), rr_breaks = seq(0, 9, 1))

cat("Creating plot O: Epilepsy\n")
PLOTO <- create_plot(data, "Epilepsy", "No epilepsy", "Epilepsy",
                     prev_ylim = c(-2, 30), rr_breaks = seq(0, 6, 1))

cat("Creating plot P: Blood condition\n")
PLOTP <- create_plot(data, "Blood", "Normal", "High blood pressure",
                     prev_ylim = c(-2, 25), rr_breaks = seq(1, 6, 1))

cat("Creating plot Q: Age\n")
PLOTQ <- create_plot(data, "agebi", "18-24", "16-17",
                     prev_ylim = c(-2, 40), rr_breaks = seq(0, 4, 0.5))


### combine plots with common legend ### 

# Combine plots with shared legend at bottom
combined1 <- ggarrange(PLOTC, PLOTI, PLOTK, 
                       PLOTL, PLOTM, PLOTN, PLOTO, PLOTP,
                       ncol = 4, nrow = 2,
                       common.legend = TRUE,
                       legend = "bottom")

combined1

combined2 <- ggarrange(PLOTQ, PLOTB, PLOTH, 
                       PLOTF, PLOTG, PLOTD, PLOTE, PLOTJ,
                       ncol = 4, nrow = 2,
                       common.legend = TRUE,
                       legend = "bottom")

combined2

### combine both plots ###

# Create empty plots as titles (left-aligned)
title1 <- ggplot() + 
  annotate(geom = "text", x = -3, y = -5, 
           label = "Health Conditions",
           size = 3.5, fontface = "bold", hjust = 3.75) + 
  theme_void() +
  theme(plot.margin = margin(5, 0, 5, 0))

title2 <- ggplot() + 
  annotate(geom = "text", x = -3, y =-5,
           label = "Demographic & Socioeconomic Factors", 
           size = 3.5, fontface = "bold", hjust = 1.7) + 
  theme_void() +
  theme(plot.margin = margin(5, 0, 5, 0))

# Combine with titles above each section
combined3 <- ggarrange(
  title1, combined1,
  title2, combined2,
  ncol = 1, nrow = 4,
  heights = c(0.1, 1, 0.1, 1),
  common.legend = TRUE,
  legend = "bottom"
)

combined3









### Prepare data for BLINDER-OAXACA in Stata ###

## force year to be numeric ### 
data$year=as.numeric(data$year)+2008

## generate age group as before ##
data <- data %>%
  mutate(agegroup = ifelse(between(age_dv, 16, 17), 1, 0))

## generate NEET_sub ##
library(labelled)

data <- data %>%
  mutate(NEET_sub = case_when(
    # Non-NEET (all other employment statuses)
    !(jbstat %in% c(3, 8, 97)) ~ 0,
    # Unemployed
    jbstat == 3 ~ 1,
    # Long-term sick or disabled
    jbstat == 8 ~ 2,
    # Doing something else
    jbstat == 97 ~ 3,
    TRUE ~ NA_real_
  )) %>%
  set_variable_labels(NEET_sub = "NEET status (4 categories)") %>%
  set_value_labels(NEET_sub = c("Non-NEET" = 0,
                                "Unemployed" = 1,
                                "Long-term sick/disabled" = 2,
                                "Doing something else" = 3))


### save the data as .dta ###
# Clean column names to be Stata-compatible
names(data) <- make.names(names(data), unique = TRUE)  # Remove illegal chars
names(data) <- gsub("\\.+", "_", names(data))  # Replace dots with underscores
names(data) <- gsub("^_+|_+$", "", names(data))  # Remove leading/trailing underscores

# Now save
write_dta(data, "NEETdata2.dta")
