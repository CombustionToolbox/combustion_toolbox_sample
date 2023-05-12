% Initialize
self = App('Soot formation extended');

% Initial conditions
self = set_prop(self, 'TR', 300, 'pR', 1, 'phi', 0.5:0.01:4);
self.PD.S_Fuel = {'C2H2_acetylene'};
self.PD.S_Oxidizer = {'N2', 'O2'};
self.PD.ratio_oxidizers_O2 = [79, 21] ./ 21;

% Additional inputs (depends of the problem selected)
self = set_prop(self, 'pP', self.PD.pR.value); 

% Solve problem
self = solve_problem(self, 'HP');

% Miscellaneous
self.Misc.display_species = {'CO2', 'CO', 'H2O', 'H2', 'O2', 'N2',...
                             'HCN', 'H', 'OH', 'O', 'CN', 'NH3', 'CH4', 'C2H4',...
                             'CH3', 'NO', 'HCO', 'NH2', 'NH', 'N', 'CH', 'Cbgrb'};

% Display output (plots)
post_results(self);