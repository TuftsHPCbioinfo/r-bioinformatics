FROM yzhangtufts/rserver:4.4.0

## Install NetCoMi
RUN Rscript -e 'devtools::install_github("zdk123/SpiecEasi")' \
    && Rscript -e 'devtools::install_github("zdk123/SpiecEasi")' \
    && Rscript -e 'devtools::install_github("stefpeschel/NetCoMi", \
                         dependencies = c("Depends", "Imports", "LinkingTo"), \
                         repos = c("https://cloud.r-project.org/", \
                                   BiocManager::repositories()))' \
    && Rscript -e 'NetCoMi::installNetCoMiPacks()'

## Regular install
RUN Rscript -e "install.packages('taxa')"

## Devtools install
RUN Rscript -e "devtools::install_github('arc85/singleseqgset')" \
    && Rscript -e "devtools::install_github('jbisanz/qiime2R')"

## BiocManager install
RUN Rscript -e "BiocManager::install('AnnotationDbi')" \
    && Rscript -e "BiocManager::install('batchelor')" \ 
    && Rscript -e "BiocManager::install('biomaRt')" \
    && Rscript -e "BiocManager::install('clustifyr')" \
    && Rscript -e "BiocManager::install(c('clusterProfiler'))" \
    && Rscript -e "BiocManager::install(c('DelayedMatrixStats'))" \
    && Rscript -e "BiocManager::install(c('DelayedArray'))" \
    && Rscript -e "BiocManager::install(c('DESeq2'))" \
    && Rscript -e "BiocManager::install(c('DESpace'))" \
    && Rscript -e "BiocManager::install(c('DOSE'))" 
    && Rscript -e "BiocManager::install('edgeR')" \
    && Rscript -e "BiocManager::install('EGSEA')" \
    && Rscript -e "BiocManager::install('EGSEAdata')" \
    && Rscript -e "BiocManager::install(c('GEOquery'))" \
    && Rscript -e "BiocManager::install(c('GenomicRanges'))" \
    && Rscript -e "BiocManager::install('GO.db')" \
    && Rscript -e "BiocManager::install('EnhancedVolcano')" \
    && Rscript -e "BiocManager::install(c('escape'))" \
    && Rscript -e "BiocManager::install('GSVA')" \
    && Rscript -e "BiocManager::install('impute')" \
    && Rscript -e "BiocManager::install('microbiome')" \ 
    && Rscript -e "BiocManager::install('metagenomeSeq')" \ 
    && Rscript -e "BiocManager::install(c('org.Cf.eg.db', 'org.Sc.sgd.db', 'org.Hs.eg.db', 'org.Mm.eg.db', 'org.Rn.eg.db'))" \
    && Rscript -e "BiocManager::install('orthogene')" \
    && Rscript -e "BiocManager::install('phyloseq')" \
    && Rscript -e "BiocManager::install('preprocessCore')" \
    && Rscript -e "BiocManager::install('qusage')" \
    && Rscript -e "BiocManager::install(c('ReactomePA'))" \
    && Rscript -e "install.packages('WGCNA')"

## Packages require remote install
RUN Rscript -e "remotes::install_github('omnideconv/immunedeconv')" 