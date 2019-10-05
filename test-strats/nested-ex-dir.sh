dir=$1
ex=$(basename "$dir" | tr -- - _)

if ! [ -d $dir/hello_world ]; then
  echo this exercise is not nested
  exit 1
fi

f=$(find $dir -name "*.v" | grep -v example | grep -v _test.v)

cp $f $dir/$ex.backup
mv $dir/example.v $f

$v test $dir
status=$?

mv $f $dir/example.v
mv $dir/$ex.backup $f

exit $status
