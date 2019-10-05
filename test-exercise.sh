repo=$(cd "$(dirname "$0")" && pwd)
if [ -z "$v" ]; then
  v=v
fi

ex=$1

exercise_succeeded_with=
exercise_failed_with=

for strat in $repo/test-strats/*.sh; do
  v=$v sh $strat $ex
  status=$?
  if [ $status -eq 0 ]; then
    exercise_succeeded_with="$exercise_succeeded_with $(basename $strat .sh)"
  else
    exercise_failed_with="$exercise_failed_with $(basename $strat .sh)"
  fi
  echo "$ex w/ $strat: $status"
done

if [ -n "$exercise_succeeded_with" ]; then
  echo "$ex succeeded with these testing methods: $exercise_succeeded_with"
  echo "$ex failed with these testing methods: $exercise_failed_with"
  exit 0
else
  echo "$ex did not succeed at all, so probably have to give up on it."
  exit 1
fi
