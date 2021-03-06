# Loads helper_00-freqs.R

# From DNAtools01022, i.e. version 0.1-22 from before refactoring
if (FALSE) {
  if (!requireNamespace('DNAtools01022', quietly = TRUE)) {
    install.packages("DNAtools01022_0.1-22.tar.gz", repos = NULL)
  }
  
  library(DNAtools01022)
  
  OLD_res_3cntr_locuswise <- do.call(rbind, DNAtools01022::pNoA(freqs, m = 3, theta = 0, locuswise = TRUE))
  dput(OLD_res_3cntr_locuswise)
  
  OLD_res_3cntr_NoA <- DNAtools01022::pNoA(freqs, m = 3, theta = 0, locuswise = FALSE)
  dput(OLD_res_3cntr_NoA)
  
  
  
  # Theta:                                                                                                                                                                                                  
  test_big_cache <- list()
  test_big_cache_i <- 1L
  
  set.seed(1)
  for (theta in c(0, 0.01, 0.003, 0.001)) {
    for (m in c(1, 2, 3, 4)) {
      #for (i in 1:10) {
      for (i in 1:5) {
        cat("theta = ", theta, "; m = ", m, "; i = ", i, "\n")
        freqs_i <-  structure(replicate(10, {g = rgamma(n=10,scale=4,shape=3); g/sum(g)}, simplify=FALSE), .Names=paste("locus",1:10,sep="."))
        
        OLD_res_locuswise <- do.call(rbind, DNAtools01022::pNoA(probs = freqs_i, m = m, theta = theta, locuswise = TRUE))
        OLD_res_NoA <- DNAtools01022::pNoA(probs = freqs_i, m = m, theta = theta, locuswise = FALSE)
        
        test_big_cache[[test_big_cache_i]] <- list(
          theta = theta,
          m = m,
          freqs = freqs_i,
          random_rep = i,
          OLD_res_locuswise = OLD_res_locuswise,
          OLD_res_NoA = OLD_res_NoA
        )
        test_big_cache_i <- test_big_cache_i + 1L
      }
    }                                                                                                                                                                                                       
  }                                                                                                                                                                                                         
  
  testthis::use_testdata(test_big_cache)
  
  #str(test_big_cache, 2)
  #saveRDS(test_big_cache, file = "obj-test_big_cache.rds")
  #test_big_cache <- readRDS("DNAtools/tests/testthat/obj-test_big_cache.rds")
  #testthis::use_testdata(test_big_cache)
  #?testthis::use_testdata
  #test_big_cache <- readRDS("obj-test_big_cache.rds")
  #test_big_cache <- testthis::read_testdata("obj-test_big_cache.rds")

  
}

OLD_res_3cntr_locuswise <- structure(c(8.62952749068611e-05, 3.71202123571815e-05, 8.90617667745235e-05, 
                                       4.18415596291452e-05, 2.08486789208077e-05, 0.000309163912444656, 
                                       3.43234182079631e-05, 3.57137052665174e-05, 9.27738484127108e-05, 
                                       6.29683737948087e-05, 0.00893757382500261, 0.00628573761230535, 
                                       0.0096568627235077, 0.00619859677019345, 0.00415672479905955, 
                                       0.0183934036817463, 0.00519712896953584, 0.00590547414977338, 
                                       0.0102564930920489, 0.00664136616294277, 0.116986429930277, 0.102783913545555, 
                                       0.121186086337067, 0.0984152691056654, 0.0799416247375628, 0.164410614796243, 
                                       0.0877489861776477, 0.0981922855873579, 0.129275653921256, 0.0991210074278818, 
                                       0.38926619385061, 0.38505175984488, 0.390991610003804, 0.374334363450482, 
                                       0.3514997238901, 0.414595896728441, 0.358504116472697, 0.377734588329248, 
                                       0.403043699819638, 0.373314446229684, 0.38675887960866, 0.403480781453922, 
                                       0.382058166683981, 0.409800655647392, 0.433703382755259, 0.331863858011732, 
                                       0.423796125786911, 0.409559383469493, 0.370767035359712, 0.409504022386746, 
                                       0.0979646275105434, 0.102360687330984, 0.0960182124848638, 0.111209273466641, 
                                       0.130677695139097, 0.0704270628693966, 0.124719319175003, 0.108572554758859, 
                                       0.0865643439589318, 0.111356189418955), .Dim = c(10L, 6L), .Dimnames = list(
                                         c("locus.1", "locus.2", "locus.3", "locus.4", "locus.5", 
                                           "locus.6", "locus.7", "locus.8", "locus.9", "locus.10"), 
                                         c("1", "2", "3", "4", "5", "6")))

OLD_res_3cntr_NoA <- structure(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 5.50982070580266e-43,
                                 7.27927280491136e-40, 4.39785072649811e-37, 1.61213860458826e-34,
                                 4.01321170711065e-32, 7.1986360451668e-30, 9.6414953739343e-28,
                                 9.86950392472136e-26, 7.84967470490023e-24, 4.91286463179217e-22,
                                 2.44603809880139e-20, 9.7864449144616e-19, 3.17736110227253e-17,
                                 8.45061937377729e-16, 1.85765870349926e-14, 3.40309512770817e-13,
                                 5.2341729535302e-12, 6.80416712280507e-11, 7.51984270715749e-10,
                                 7.10226155844895e-09, 5.75850046048429e-08, 4.02411434797639e-07,
                                 2.43209718067193e-06, 1.27509395932902e-05, 5.81394968204302e-05,
                                 0.000231054497677017, 0.000801782448943299, 0.00243291973285554,
                                 0.00646260580901686, 0.0150392714088191, 0.0306736920067915,
                                 0.0548344085316054, 0.0858927005962925, 0.11780775519838, 0.141325571305851,
                                 0.148049934569241, 0.135150597360308, 0.107217764980621, 0.0736646262174239,
                                 0.0436437891278527, 0.0221778548638664, 0.00960113716706416,
                                 0.00351103161494827, 0.00107280873736951, 0.000270024654561182,
                                 5.49259688521801e-05, 8.79149031070079e-06, 1.06457798102228e-06,
                                 9.15668122782673e-08, 4.98000869357637e-09, 1.28630909189188e-10
), .Names = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
              "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21",
              "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32",
              "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43",
              "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54",
              "55", "56", "57", "58", "59", "60"))

#test_big_cache <- testthis::read_testdata("test_big_cache.rds")
test_big_cache <- readRDS("testdata/test_big_cache.rds")
