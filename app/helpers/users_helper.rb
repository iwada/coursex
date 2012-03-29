module UsersHelper
  def roles
    [

        ['Trainer', '1'],
        ['Administrator', '2'],
        ['Super Admin', '3'],


    ]

  end

  def m(message)
  return "data-original-title = " + message.to_s
  end
end
