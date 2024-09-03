% Import packages
import combustiontoolbox.databases.NasaDatabase
import combustiontoolbox.core.*
import combustiontoolbox.equilibrium.*

% Get Nasa database
DB = NasaDatabase();

% Define chemical system
system = ChemicalSystem(DB, 'soot formation extended');

% Initialize mixture
mix = Mixture(system);

% Define chemical state
set(mix, {'C2H2_acetylene'}, 'fuel', 1);
set(mix, {'N2', 'O2'}, 'oxidizer', [79, 21] / 21);

% Define properties
mixArray = setProperties(mix, 'T', 300, 'p', 1, 'equivalenceRatio', 0.5:0.01:4);

% Initialize solver
solver = EquilibriumSolver('problemType', 'HP');

% Solve problem
solver.solveArray(mixArray);

% Set displaySpecies
displaySpecies = {'CO2', 'CO', 'H2O', 'H2', 'O2', 'N2',...
                  'HCN','H','OH','O','CN','NH3','CH4','C2H4','CH3',...
                  'NO','HCO','NH2','NH','N','CH','Cbgrb'};
solver.plotConfig.displaySpecies = displaySpecies;

% Generate report
report(solver, mixArray);