Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199694;
	b=eg4cV8PTIbGIqQRCUCrMheccpYtnuXa5tTb1jpK1mvhrYiNNATJkSPMpdMjRVlIbZM4H
	 2nWLThTAWQM81STmulmz7bk2Ybd03om2QvgQOrB/sZiC3Tv/E1r/iFZ+OjLw6VLsDuFyO
	 HfgJxa+OYhuOtGsM3YnpVjLO7qZ9jLKEPPls5JSW3wrc5Ka1JiuvpYXHQddYCSPFwnEo9
	 wUd9bCp1Ya2A1uXJx3mzJPOFijMIbIPAoRmj0+aHKo0svlYZp9HZCUZVUVFwHpQy6Jc39
	 WNwhIsvAatQB7aFaD87PjjUciM/JiFPwmlzCYzq1RfdLOT28pIUuMzFKvFgEuEb0ySA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199694;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=FodwuhGNyXxVqEJN1WVKCjLa+lGk8J9ntTHyhxLg7OQ=;
	b=afyQ1N45udBNzFml15zhI3i5BItn6T+dn/qB6jjP+TmiTsWBxH2hgZOHxyuwl9908R/U
	 oelHBkR9bAilrL7Tto/BCUIQTpMc9RqpI8a4Fh7jLQZN3y0vuilkdJnqCDncy3tdX1bT1
	 KBm0fmASAB1N0d3X/AEyMvyiQNSsm+uGrwIjCsdaBvz75PhC5eYzU/T+OCfVVI0AONwNi
	 d8qpiKq8HDOSVqZUgt0dhhpao3GRrFyhMEaWTBpDAtjqScw3xM2g/Hvz9zB13ButAzcj+
	 MEtWr26DmhOTXGpLyIwsq3xmq4/wrbRDH2BGWGqF7hCmKPtiryeZtJ2u+6wsCkOg/ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25C9606A327
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 15:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25C9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 04FA668BFE; Wed, 28 Oct 2026 16:01:30 +0100 (CET)
Date: Wed, 28 Oct 2026 16:01:29 +0100
From: Christoph Hellwig <hch@lst.de>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <djwong@kernel.org>, changfengnan@bytedance.com,
	kbusch@kernel.org, Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
	David Sterba <dsterba@suse.com>, Gao Xiang <xiang@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Carlos Maiolino <cem@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>, libaokun@linux.alibaba.com,
	bfoster@redhat.com, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, Viacheslav Dubeyko <slava@dubeyko.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	linux-nilfs@vger.kernel.org, fuse-devel@lists.linux.dev,
	Zhang Yi <yi.zhang@huawei.com>
Subject: Re: [PATCH 2/5] fuse: convert ext_map iomap ops to ->iomap_next()
Message-ID: <20261028150129.GB15828@lst.de>
References: <20261027215326.2693300-1-joannelkoong@gmail.com> <20261027215326.2693300-3-joannelkoong@gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027215326.2693300-3-joannelkoong@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Hmm, it would have been nice to CC adding a new creative iomap use
to the relevants lists..

Anyway, the conversion looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

