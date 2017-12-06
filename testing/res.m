function res = getresult(i, correct)
res = [0, 0];

i1 = i == 1;
c1 = correct == 1;
i0 = i == 0;
c0 = correct == 0;

tp = and(i1,c1);
fp = and(i0,c1);
fn = and(i1,c0);
tn = and(i0,c0);

trueP = sum(tp(:));
falseP = sum(fp(:));
falseN = sum(fn(:));
trueN = sum(tn(:));

res(1) = trueP / (trueP + falseN);
res(2) = trueN / (trueN + falseP);
