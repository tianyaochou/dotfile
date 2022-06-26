let
  # set ssh public keys here for your system and user
  system = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWzeTQPhGfAD7WLlWlYArUJVYk3N3i7cX+qMsGi/OHZc1PG0knSANLNZqj8Zlmjt95HevfhnHR4otyQ6WoV4v/2ORnt9ZTSnWH/r2W2AOiukabi1/2f9PgzX5J4uO7ZuBeymo3P2GxRkPugaYvHRBPzXAevH4/UarhhyxpQ/Ia7h8rZ8n1GLTbzhMKRnxgEZGKhHOwmbLJ2DOmiN4I3oknDR6u+0oWphrEX48sDZnL0zsLceUHnjkWWgtA8J4tjO65DE8sR4rQLtfVJA94AG5IWY2xqNyacdG7niBIn62sJxh8ozoAmF80rgEzvx+Dvn8OqvONIz0UYGHRfLm2pPyN tchou@MacBook-Pro.local";
  user = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJROQA4xoYBxonhNUNObAAozsacacNKndDXqfTt0hL3pF3RSfsb8kawFws7Uv2fCLB5qdUwgCLQbcybHLt4ibDTao3pR7/fM9GN0mcVqrMljjrRHul+JqZr3U15Mh7gkn208H1QiKs+FmiRdtJBJxME8vs3p+vujTX9b+qaTMBU1G9qT3eXC8obWtO5WMVV2qmSljY4w3nKy1ncDVvwukZ51UzNJayLjdauxBAvtVlzB8vvnbYsHn3kTQGHz7o0Kl+wQ/qWU2ofiytTcIZ91VaqLGBk5TQYbV6CnoOfc6iQKAzYzjPQz7jbnE8cWxQUIhfsO4wHtAcy+RyI4rITVE1 tchou@Tianyaos-MacBook-Pro.local";
  allKeys = [ system user ];
in
{
  "secret.age".publicKeys = allKeys;
  "clash/config.yaml.age".publicKeys = allKeys;
  "v2ray/jms.json.age".publicKeys = allKeys;
}
