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
RUN Rscript -e "install.packages('taxa')" \
    && Rscript -e "install.packages('DGCA')" \
    && Rscript -e "install.packages('rrBLUP')" \
    && Rscript -e "install.packages('Rtsne')"

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
    && Rscript -e "BiocManager::install(c('DEGreport'))" \
    && Rscript -e "BiocManager::install(c('DESeq2'))" \
    && Rscript -e "BiocManager::install(c('DESpace'))" \
    && Rscript -e "BiocManager::install(c('DOSE'))"  \
    && Rscript -e "BiocManager::install('edgeR')" \
    && Rscript -e "BiocManager::install('EGSEA')" \
    && Rscript -e "BiocManager::install('EGSEAdata')" \
    && Rscript -e "BiocManager::install('enrichplot')" \
    && Rscript -e "BiocManager::install('GeomxTools')" \
    && Rscript -e "BiocManager::install('GeoMxWorkflows')" \
    && Rscript -e "BiocManager::install(c('GEOquery'))" \
    && Rscript -e "BiocManager::install(c('GenomicRanges'))" \
    && Rscript -e "BiocManager::install('GO.db')" \
    && Rscript -e "BiocManager::install('GOSim')" \
    && Rscript -e "BiocManager::install('EnhancedVolcano')" \
    && Rscript -e "BiocManager::install(c('escape'))" \
    && Rscript -e "BiocManager::install('GSVA')" \
    && Rscript -e "BiocManager::install('impute')" \
    && Rscript -e "BiocManager::install('limma')" \
    && Rscript -e "BiocManager::install('microbiome')" \ 
    && Rscript -e "BiocManager::install('metagenomeSeq')" \ 
    && Rscript -e "BiocManager::install('NanoStringNCTools')" \ 
    && Rscript -e "BiocManager::install('OmnipathR')" \ 
    && Rscript -e "BiocManager::install(c('org.Cf.eg.db', 'org.Sc.sgd.db', 'org.Hs.eg.db', 'org.Mm.eg.db', 'org.Rn.eg.db'))" \
    && Rscript -e "BiocManager::install('orthogene')" \
    && Rscript -e "BiocManager::install('phyloseq')" \
    && Rscript -e "BiocManager::install('preprocessCore')" \
    && Rscript -e "BiocManager::install('qusage')" \
    && Rscript -e "BiocManager::install(c('ReactomePA'))" \
    && Rscript -e "BiocManager::install(c('SNPRelate'))" \
    && Rscript -e "BiocManager::install(c('SpatialDecon'))" \
    && Rscript -e "install.packages('WGCNA')"

## Remote install
RUN Rscript -e "remotes::install_github('omnideconv/immunedeconv')" 

## More packages from 4.3.0 library
RUN Rscript -e "BiocManager::install(c('affy', 'affyio', 'annotate', 'AnnotationDbi', \
    'AnnotationFilter', 'AnnotationForge', 'AnnotationHub', 'AnnotationHubData', 'basedosdados', \
    'basilisk', 'basilisk.utils', 'beachmat', 'beanplot', 'beeswarm', 'BiasedUrn', 'biglm', \
    'bigrquery', 'Biobase', 'BiocCheck', 'BiocFileCache', 'BiocGenerics', 'BiocIO', 'BiocNeighbors', \
    'BiocParallel', 'BiocSingular', 'BiocVersion', 'biocViews', 'biomaRt', 'Biostrings', 'biovizBase', \
    'BoolNet', 'BSgenome', 'bsseq', 'bumphunter', 'celldex', 'clusterProfiler', 'DelayedArray', \
    'DelayedMatrixStats', 'densvis', 'depmap', 'dichromat', 'diptest', 'dir.expiry', 'DMRcate', \
    'DMRcatedata', 'dnaMethyAge', 'DOSE', 'DoubletFinder', 'DSS', 'DT', 'ENmix', \
    'enrichplot', 'ensembldb', 'epiNEM', 'ExperimentHub', 'ExperimentHubData', 'fastcluster', \
    'FDb.InfiniumMethylation.hg19', 'fgsea', 'FlowSorted.Blood.EPIC', 'gapminder', 'genefilter', \
    'geneplotter', 'GenomeInfoDb', 'GenomeInfoDbData', 'GenomicAlignments', 'GenomicFeatures', \ 
    'GenomicRanges', 'GEOquery', 'ggpp', 'ggtree', 'GO.db', 'GOSemSim', 'graph', 'gridGraphics', \
    'gson', 'Gviz', 'HDF5Array', 'HDO.db', 'IlluminaHumanMethylation450kanno.ilmn12.hg19', \
    'IlluminaHumanMethylation450kmanifest', 'IlluminaHumanMethylationEPICanno.ilm10b4.hg19', \
    'IlluminaHumanMethylationEPICmanifest', 'illuminaio', 'impute', 'interactiveDisplayBase', \
    'IRanges', 'isva', 'KEGGgraph', 'KEGGREST', 'kernlab', 'lambda.r', 'latex2exp', 'latticeExtra',
    'Linnorm', 'lmerTest', 'locfit', 'Maaslin2', 'MAGeCKFlute', 'MAST', 'MatrixGenerics', 'maxprobes', \
    'metagenomeSeq', 'MethylAid', 'methylclock', 'methylclockData', 'methylumi', 'minet', 'minfi', \
    'minfiData', 'missMethyl', 'mnem', 'multcomp', 'multtest', 'nempi', 'OrganismDbi', 'org.Hs.eg.db', \
    'patchwork', 'pathview', 'pcalg', 'pheatmap', 'planet', 'prabclus', 'preprocessCore', 'ProtGenerics', \
    'pscl', 'RcppHNSW', 'RcppML', 'restfulr', 'rgl', 'Rgraphviz', 'rhdf5', 'rhdf5filters', 'Rhdf5lib', \
    'Rhtslib', 'R.methodsS3', 'rngtools', 'Rsamtools', 'rsvd', 'rtracklayer', 'S4Arrays', 'S4Vectors', 'sandwich', \
    'ScaledMatrix', 'scuttle', 'sesame', 'sesameData', 'siggenes', 'snakecase', 'SummarizedExperiment', \
    'sva', 'trackplot', 'treeio', 'TxDb.Hsapiens.UCSC.hg19.knownGene', 'VariantAnnotation', 'wateRmelon', \
    'Wrench', 'XVector', 'zlibbioc'))"
