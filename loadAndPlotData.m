data = load('DonneesCC.mat');

figure
X = [%data.x1(:, 1);
    data.x2(:, 1);
    data.x3(:, 1);
    %data.x4(:, 1)
    ];
Y = [%data.x1(:, 2);
    data.x2(:, 2);
    data.x3(:, 2);
    %data.x4(:, 2)
    ];
Z = [%data.x1(:, 3); 
    data.x2(:, 3); 
    data.x3(:, 3); 
    %data.x4(:, 3)
    ];

C = [%repmat([0 0 0], size(data.x1, 1), 1); 
    repmat([1 0 0], size(data.x2, 1), 1); 
    repmat([0 0 1], size(data.x3, 1), 1); 
    %repmat([0 1 0], size(data.x4, 1), 1)
    ];

S = repmat([5],numel(X),1);
s = S(:);
c = C(:);

scatter3(X, Y, Z, s, C);
