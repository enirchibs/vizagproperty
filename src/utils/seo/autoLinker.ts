interface LinkMap {
  [keyword: string]: string;
}

// 1. Define the keyword-to-URL dictionary matching your exact SEO taxonomy
const KEYWORD_LINK_MAP: LinkMap = {
  'plots for sale in vizag': '/plots',
  'plots for sale in bhogapuram vizag': '/plots/bhogapuram',
  'plots for sale in bhogapuram': '/plots/bhogapuram',
  'vuda approved plots in vizag': '/plots/vuda-approved',
  'vuda & vmrda approved plots': '/plots/vuda-approved',
  'gated community plots for sale in vizag': '/plots/gated-community',
  'open land in visakhapatnam': '/plots',
  'residential plots for sale in vizag': '/plots',
  'villas for sale in madhurawada': '/residential/villas/madhurawada',
  'plots in anandapuram vizag': '/plots/anandapuram',
  'new apartments in visakhapatnam': '/residential/flats',
  'luxury villas for sale in vizag': '/residential/villas',
  'shops for rent in vizag': '/commercial/shops-for-rent',
  'plots in tarluvada visakhapatnam': '/plots/tarluvada'
};

/**
 * Automatically injects internal anchors into a Markdown string based on a predefined dictionary.
 * Safely avoids modifying attributes, headings, HTML tags, or text already nested inside <a> tags
 * or Markdown links `[text](url)`.
 * 
 * @param content Raw Markdown content from the database
 * @param maxLinksPerPost Hard limit to prevent over-optimization penalties
 */
export function injectInternalLinks(content: string, maxLinksPerPost: number = 5): string {
  if (!content) return '';

  // Sort keywords by length descending so longer phrases match first
  const sortedKeywords = Object.keys(KEYWORD_LINK_MAP).sort((a, b) => b.length - a.length);

  // Track already linked URLs within the current post execution path to prevent multi-linking dilution
  const linkedUrls = new Set<string>();
  let dynamicLinkCount = 0;

  // Split string into text fragments, HTML tags, and Markdown links to protect them
  // Group 1 matches HTML tags (e.g. <a href="...">) OR Markdown links (e.g. [text](url))
  const tokens = content.split(/(<\/?[^>]+>|\[.*?\]\(.*?\))/g);
  
  let insideAnchorBlock = false;

  const processedTokens = tokens.map((token) => {
    if (!token) return '';

    // If token is an HTML tag or a Markdown link, protect it.
    if (token.startsWith('<') || token.startsWith('[')) {
      if (token.toLowerCase().startsWith('<a ') || token.toLowerCase() === '<a>') {
        insideAnchorBlock = true;
      }
      if (token.toLowerCase() === '</a>') {
        insideAnchorBlock = false;
      }
      return token; // Return unaltered to prevent corruption
    }

    // If we are currently parsing text inside an existing HTML <a> tag, do not modify it
    if (insideAnchorBlock) {
      return token;
    }

    // Process plain text nodes for keyword injections
    let textNode = token;

    for (const keyword of sortedKeywords) {
      if (dynamicLinkCount >= maxLinksPerPost) break;

      const targetUrl = KEYWORD_LINK_MAP[keyword];
      
      // Skip if this specific landing destination has already been linked in this run
      if (linkedUrls.has(targetUrl)) continue;

      // Construct case-insensitive boundary regex matching the exact phrase safely
      // \b doesn't always work perfectly if the keyword contains special characters, but for alphanumeric it's fine.
      const regex = new RegExp(`\\b(${keyword})\\b`, 'gi');

      if (regex.test(textNode)) {
        // Replace first match instance with standard Markdown link syntax
        textNode = textNode.replace(regex, (match) => {
          linkedUrls.add(targetUrl);
          dynamicLinkCount++;
          // Returning a markdown link. react-markdown will parse this naturally and use our router link if configured,
          // or a standard <a> tag.
          return `[${match}](${targetUrl})`;
        });
      }
    }

    return textNode;
  });

  return processedTokens.join('');
}
