dir=$1
ex=$(basename "$dir" | tr -- - _)

cd $dir

f=$(find -name "*.v" | grep -v example | grep -v _test.v)

cp $f $ex.backup
mv example.v $f

$v test .
status=$?

mv $f example.v
mv $ex.backup $f

exit $status
