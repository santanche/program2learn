% Bacterial Taxonomy Knowledge Graph
% Facts derived from CSV: resource, property, value

% Species to Genus relationships
is_a('V. cholerae', 'Vibrio').
is_a('P. aeruginosa', 'Pseudomonas').
is_a('S. typhi', 'Salmonella').
is_a('E. coli', 'Escherichia').
is_a('N. gonorrhoeae', 'Neisseria').
is_a('S. aureus', 'Staphylococcus').
is_a('S. pyogenes', 'Streptococcus').
is_a('C. difficile', 'Clostridium').
is_a('B. anthracis', 'Bacillus').
is_a('L. monocytogenes', 'Listeria').

% Genus to Family/Order relationships
is_a('Vibrio', 'Gammaproteobacteria').
is_a('Pseudomonas', 'Pseudomonadaceae').
is_a('Pseudomonadaceae', 'Gammaproteobacteria').
is_a('Salmonella', 'Enterobacteriaceae').
is_a('Escherichia', 'Enterobacteriaceae').
is_a('Enterobacteriaceae', 'Gammaproteobacteria').
is_a('Neisseria', 'Betaproteobacteria').
is_a('Staphylococcus', 'Bacillales').
is_a('Bacillus', 'Bacillales').
is_a('Streptococcus', 'Lactobacillales').
is_a('Listeria', 'Listeriaceae').
is_a('Listeriaceae', 'Bacillales').
is_a('Clostridium', 'Clostridia').

% Class to Phylum relationships
is_a('Gammaproteobacteria', 'Pseudomonadota').
is_a('Betaproteobacteria', 'Pseudomonadota').
is_a('Bacillales', 'Bacilli').
is_a('Lactobacillales', 'Bacilli').
is_a('Bacilli', 'Bacillota').
is_a('Clostridia', 'Bacillota').

% Phylum to Domain relationships
is_a('Pseudomonadota', 'Bacteria').
is_a('Bacillota', 'Bacteria').

% Gram stain properties
gram_stain('Pseudomonadota', negative).
gram_stain('Bacillota', positive).

% Cell shape properties
cell_shape('V. cholerae', rod).
cell_shape('Enterobacteriaceae', rod).
cell_shape('Pseudomonadaceae', rod).
cell_shape('N. gonorrhoeae', coccus).
cell_shape('Staphylococcus', coccus).
cell_shape('Streptococcus', coccus).
cell_shape('Clostridia', rod).
cell_shape('Listeriaceae', rod).
cell_shape('Bacillus', rod).

% Transitive closure rule for is_a relationships
ancestor(X, Y) :- is_a(X, Y).
ancestor(X, Z) :- is_a(X, Y), ancestor(Y, Z).

% Inherited property rules
has_gram_stain(X, Stain) :- 
    gram_stain(X, Stain).
has_gram_stain(X, Stain) :- 
    ancestor(X, Y), 
    gram_stain(Y, Stain).

has_cell_shape(X, Shape) :- 
    cell_shape(X, Shape).
has_cell_shape(X, Shape) :- 
    ancestor(X, Y), 
    cell_shape(Y, Shape).
