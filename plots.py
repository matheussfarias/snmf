import matplotlib.pyplot as plt
import numpy as np

# data get from matlab code (matplotlib is prettier than matlab for plots)

plt.bar(['SVD', 'Semi-NMF32', 'Semi-NMF16', 'Semi-NMF8','Semi-NMF6', 'Semi-NMF4'], np.array([39.9980, 39.9980, 39.9981, 47.8276, 112.7942, 1.7727e+03]), color='green',linewidth=2, edgecolor='black')
plt.ylabel(r'Frobenius Norm Error', fontsize=12)
plt.xticks(rotation=20, fontsize = 12)
plt.yscale('log')
plt.ylim(0.8e1, 1e4)
plt.tight_layout()
plt.savefig('plots/error_r64.pdf')
plt.show()

plt.bar(['SVD', 'Semi-NMF32', 'Semi-NMF16', 'Semi-NMF8','Semi-NMF6', 'Semi-NMF4'], np.array([0, 0, 9.3431e-08, 0.0057, 0.0890, 1.4045])/1.4045, color='purple',linewidth=2, edgecolor='black')
plt.ylabel(r'$\Delta_{SVD}$', fontsize=12)
plt.xticks(rotation=20, fontsize = 12)
plt.tight_layout()
plt.yscale('log')
plt.savefig('plots/rank16.pdf')
plt.show()

plt.bar(['SVD', 'Semi-NMF32', 'Semi-NMF16', 'Semi-NMF8','Semi-NMF6', 'Semi-NMF4'], np.array([0, 0, 4.3668e-07, 0.0287, 0.3916, 7.2898])/7.2898, color='purple',linewidth=2, edgecolor='black')
plt.ylabel(r'$\Delta_{SVD}$', fontsize=12)
plt.xticks(rotation=20, fontsize = 12)
plt.tight_layout()
plt.yscale('log')
plt.savefig('plots/rank32.pdf')
plt.show()

plt.bar(['SVD', 'Semi-NMF32', 'Semi-NMF16', 'Semi-NMF8','Semi-NMF6', 'Semi-NMF4'], np.array([0, 0, 3.1849e-06, 0.1907, 1.8060, 39.2033])/39.2033, color='purple',linewidth=2, edgecolor='black')
plt.ylabel(r'$\Delta_{SVD}$', fontsize=12)
plt.xticks(rotation=20, fontsize = 12)
plt.tight_layout()
plt.yscale('log')
plt.savefig('plots/rank64.pdf')
plt.show()

plt.bar(['SVD', 'Semi-NMF32', 'Semi-NMF16', 'Semi-NMF8','Semi-NMF6', 'Semi-NMF4'], np.array([0, 5.7981e-11, 168.7483, 4.2787e+04, 2.4362e+05, 5.0990e+06])/5.0990e+06, color='purple',linewidth=2, edgecolor='black')
plt.ylabel(r'$\Delta_{SVD}$', fontsize=12)
plt.xticks(rotation=20, fontsize = 12)
plt.tight_layout()
plt.yscale('log')
plt.savefig('plots/rank128.pdf')
plt.show()

plt.bar(['16', '32', '64', '128'],[90.62, 81.25, 62.50, 25.00], color = 'crimson', linewidth=2, edgecolor='black')
plt.xlabel(r'Factorization Rank, $k$')
plt.ylabel(r'Area Savings, $R_m$ (%)')
plt.ylim([0,100])
plt.tight_layout()
plt.savefig('plots/area.pdf')
plt.show()

plt.bar(['16', '32', '64', '128'],[92.19, 84.38, 68.75, 37.50], color = 'navy', linewidth=2, edgecolor='black')
plt.xlabel(r'Factorization Rank, $k$')
plt.ylabel(r'Parameter Savings, $R_p$ (%)')
plt.ylim([0,100])
plt.tight_layout()
plt.savefig('plots/parameter.pdf')
plt.show()
