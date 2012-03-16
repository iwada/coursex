module BranchesHelper
  def countries
    [
        ['AFGHANISTAN', 'AFGHANISTAN'],
        ['ALAND ISLANDS', 'AX'],
        ['ALBANIA', 'AL'],
        ['NIGERIA', 'NG'] ,
        ['UAE', 'UE']

    ]
  end

  def recent_branch
   @recent_branch = Branch.last.name
  end

  def most_active
    @most_active = Branch.first.name
  end
end
