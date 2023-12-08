import matplotlib.pyplot as plt

# data get from matlab code (matplotlib is prettier than matlab for plots)
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
