defmodule IngestSurroundingSuburbs do
  def hello do
    File.stream!("resources/surrounding_suburbs_XL.csv")
    |> Flow.from_enumerable()
    |> Flow.map(&String.split(&1, ","))
    |> Flow.map(& row2map(&1))
    |> Enum.to_list
    |> IO.inspect
  end

  defp index(_payload) do
    HTTPotion.get("http://google.com.au/").status_code
  end
  
  defp row2map(row) do
    %{
      :source_id        => Enum.at(row, 0),
      :source_name      => Enum.at(row, 1),
      :source_state     => Enum.at(row, 2),
      :source_postcode  => Enum.at(row, 3),
      :source_subtype   => Enum.at(row, 4),
      :target_id        => Enum.at(row, 5),
      :target_name      => Enum.at(row, 6),
      :target_state     => Enum.at(row, 7),
      :target_postcode  => Enum.at(row, 8),
      :target_subtype   => Enum.at(row, 9)
    }
  end
end
