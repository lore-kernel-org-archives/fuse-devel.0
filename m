Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692091;
	b=Tq5cN+JGJfVcxxJCz/E6zwPPago52588JVYBj9ea0F6ijSoWxWrjvClAFBbelPdZ6pth
	 iUsEWFsS0QvcPnrDpCNwQO8MhFlucv+Q2kp2ePg4mjVjkNmEAumc6qSZytZCmCGi7xmo8
	 W7KXXN1ksFeWUxALdYVKPLAhUaUEVi5+K1mq2ljOIMKbhjC3MwE7/2dHNkaGH8eVRX+RW
	 Dl+CXk7B5OywMGOFwTEQCvtQyX/5/6B7fk1EYgptjuz6aTrDKxZHYx9xs1BS6T/Xcdcz4
	 tkYRqrtRIT1iUMUDk4ugSHbd8Xh0xAOOpAcYA1J4tLQTMfU7Bk2CJO5bkqAADoYTORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692091;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=kQK8aK74JVGjWxIv+7BaJoXtxDmfIaYAlXbrpeu/j4U=;
	b=g+dsNNacOmV1P76jTmSuuFySNSuVFaKdNKjmcBxATcG5pQIcnPaKFF84Q9LIg6Vp7Lyp
	 9AeSN24IXcgoR88c1MvojS6afJnRNxwt7zuPt7OuE9tLxYza/jJmY8AGluaSyHhHywKf3
	 KC+3n/cL0NZOUDxf0MBayaYJ+w7ZCkfuZk+2DR5TYwqiAZxf8gn4wvUlBgyTiUbl5BF+N
	 Viu7DTskkQNX+pr/i5j/6T4e5jyFGm+y4V3FSkxRDaSoNbE4yVRXBQ5NcsAw7LAYWi+rg
	 t/75xqd6opB5FYsZPukHoy+LeFXIpGBWXee2+gCc3XIcBJSFNmch67BRok1hxfDiucw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E2D606A32C
	for <fuse-devel@lists.linux.dev>; Tue,  3 Nov 2026 07:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E2D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3028C68AFE; Tue,  3 Nov 2026 08:48:06 +0100 (CET)
Date: Tue, 3 Nov 2026 08:48:06 +0100
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
Subject: Re: [PATCH 0/5] iomap: remaining patches for iomap_iter_next
 conversion
Message-ID: <20261103074806.GC3678@lst.de>
References: <20261027215326.2693300-1-joannelkoong@gmail.com> <CAJnrk1bqPCy8ryVjCsUWR2+4jkNE8rJJU2bUFsO3Q7nznsF7xA@mail.gmail.com>
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
In-Reply-To: <CAJnrk1bqPCy8ryVjCsUWR2+4jkNE8rJJU2bUFsO3Q7nznsF7xA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Oct 30, 2026 at 12:48:15PM -0700, Joanne Koong wrote:
> I pulled in Linus's latest tree (commit abf8c33470f7) and the series
> still applies cleanly with no conflicts. It also applies cleanly on
> top of next-20261030, which includes the remaining btrfs, ntfs, exfat,
> ext2, and gfs2 changes that haven't been merged yet. There shouldn't
> be any conflicts between this series and anything else going in this
> window.

Alright.  Let's get them into the vfs tree and linux-next for a few
days and off to Linus before -rc2!

