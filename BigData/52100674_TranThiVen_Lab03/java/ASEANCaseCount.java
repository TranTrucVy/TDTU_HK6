import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;

public class ASEANCaseCount {

    public static class TokenizerMapper extends Mapper<Object, Text, Text, LongWritable> {

        private final static LongWritable one = new LongWritable(1);
        private Text country = new Text();

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            // Assuming your data has columns separated by a tab
            System.out.println(value.toString());
            String[] columns = value.toString().split("\t");

            // Adjust column indices based on your data structure
            String countryName = columns[0].trim();
            String region = columns[1].trim();
            long cases = 0;
            try {
            	String cleanedCases = columns[2].trim().replaceAll("[,.]", "");

                // Remove trailing ".000"
                if (cleanedCases.endsWith(".000")) {
                    cleanedCases = cleanedCases.substring(0, cleanedCases.length() - 4);
                }
		cases = Long.parseLong(cleanedCases);
            } catch (Exception error) {
            	System.out.println(error);
            	cases = 0;
            }

            // Check if the country belongs to ASEAN
            if (isASEANCountry(region)) {
                System.out.println(region);
                country.set(countryName);
                context.write(country, new LongWritable(cases));
            }
        }

        private boolean isASEANCountry(String region) {
            // Implement logic to check if the region is "South-East Asia"
            return region != null && region.trim().equalsIgnoreCase("South-East Asia");
        }
    }

    public static class IntSumReducer extends Reducer<Text, LongWritable, Text, LongWritable> {

        private LongWritable result = new LongWritable();

        public void reduce(Text key, Iterable<LongWritable> values, Context context)
                throws IOException, InterruptedException {
            int sum = 0;
            for (LongWritable val : values) {
                sum += val.get();
            }
            result.set(sum);
            context.write(key, result);
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "ASEAN Case Count");
        job.setJarByClass(ASEANCaseCount.class);
        job.setMapperClass(TokenizerMapper.class);
        job.setCombinerClass(IntSumReducer.class);
        job.setReducerClass(IntSumReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(LongWritable.class);
        // Set your input and output paths
        Path inputPath = new Path("/user/alfiee/lab03/input/WHO-COVID-19-20210601-213841.tsv");
        Path outputPath = new Path("/user/alfiee/lab03/output-java");
        org.apache.hadoop.mapreduce.lib.input.FileInputFormat.addInputPath(job, inputPath);
        org.apache.hadoop.mapreduce.lib.output.FileOutputFormat.setOutputPath(job, outputPath);
        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}