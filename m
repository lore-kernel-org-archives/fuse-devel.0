Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199654;
	b=2px8TYr42YMbpqhrSzV/4fGD5cuLjdRxjUsU6LqtDliLkK5sLUXc87a9IE8wudqMCMqM
	 oznkHA+UddObsYLAwkcnMwJeb83E1p1I2Yu5lBeTRwNkc+MQ5IeBuBqkJG7v0hxe3qG72
	 BKXk9MBUU7I8L9A3OLEVZm5GYmgxl9AB/2HrMQYNgjco2UbxpMYHzmmWDtRbUj9LiLrHy
	 i8owSG5YbsNrfauRcdWu4wyU58c3aZfHzlZ+C7cpC3LCsNazIdpqEUDtjV2tH78t25L1g
	 28qw+dwkS+wV4rYK48vc1cgB8xUrVojEoAO+bQau0dSu3znnge9zGFFzfsHO2XShrEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199654;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=SqsVhitOdePujGrPLjfjoRG/ResbjWYsPperqBhRTF4=;
	b=EbwAbLGIy9Oa4nkwJLFEuz06vJSHM3UAqShmUujlGQq7s4Y9uyf4//o+CU8+FTgNNQ4v
	 B+0qEld7UF7rkQaT8p/WHnXgeYyVkOBkfxLd+1E9AVpsdfXLzm1u+H3byzhFkp8OdCcg6
	 FRJ2zhXye3jelZfvjFG1XyM1wZpCMbvAMyB99rZnbq1IH7JfLllNazgFy0VTTAlAboZII
	 XAMEy9SE4Xie1bw/d8pQ8ntJZfDW55MZzh1Q4YXS/Ydruilhmm/gsPqQAi97znGxEIzgC
	 kcr7y1WxxaFCea+Su+RWvsqVg0OHcJTn8TDGyKer1L2P4VVo7AEsCHYTbVzbEgVgY0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70765606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 15:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70765606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9DB8768AFE; Wed, 28 Oct 2026 16:00:49 +0100 (CET)
Date: Wed, 28 Oct 2026 16:00:48 +0100
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
Subject: Re: [PATCH 1/5] nilfs2: convert iomap ops to ->iomap_next()
Message-ID: <20261028150048.GA15828@lst.de>
References: <20261027215326.2693300-1-joannelkoong@gmail.com> <20261027215326.2693300-2-joannelkoong@gmail.com>
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
In-Reply-To: <20261027215326.2693300-2-joannelkoong@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Oct 27, 2026 at 02:53:22PM -0700, Joanne Koong wrote:
> Convert nilfs2 iomap_ops to the new ->iomap_next() callback. The callback
> is generated with the DEFINE_IOMAP_ITER_NEXT() macro, which wraps the
> iomap_iter_next() helper to finish the previous mapping if needed and
> produce the next one. No functional changes are intended.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

