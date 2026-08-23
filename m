Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A681F1932
	for <fuse-devel@lists.linux.dev>; Sun, 23 Aug 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787504243; cv=none; b=ipYOTlwWW7OxF17Oh8Xp6Tzw3s8Zdzjbh9PjU90a9WZ5xR2nYOWMjyq/5Lf2VQ9+n3/9hjsurS5Qll/3XW5V7YUMRc90JVnxiua851aCEhqgwiKx92QpKR/TgomWjzvuD8q8dYLtQ5t+lKl37Qfql3FKe3MoeZicduKT7EMQoFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787504243; c=relaxed/simple;
	bh=FifPijUxYmOn0khIUeWNQnDh6M3c7SYp2DOwVf6Fxy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOq4xU7vh4rkyJV2r3ELxYjStzbIwcupWG+lxgKTtmlKSJ/2vVlMGdGBIUeimbjaIg20FCHJb+ulOWIg5T3BxAn76ny7ZOnUWjZ+o+SCaOuoK118ASky+IdmxFijfRZofRy5oB5vZOLAOLELNLZAejtcHFi8S3wBO+KyPRUif40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jd662xGD; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jd662xGD"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e6c4a867cso154346285a.0
        for <fuse-devel@lists.linux.dev>; Sun, 23 Aug 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787504241; x=1788109041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=syT7GQtDMHPLcTTAdV7OL+T3aNWROaJmphq5EZ8nhH0=;
        b=jd662xGD2KiCSZjL0wvO0WZkA4YJ5Fx0onfFVXyUxYR/v+H4ttTR8EdnJ3zJMcV21H
         oBiaI0wIZegz9RbLNCz3Mphkr3oMym1P42pwNTIXVz+T71FZhcGh/uyeyQtvZFG5QvPa
         xcr40icBNaOnoThHbayluUaoeVRwDW1jNZCOx2y7CIebwVbhREemojmQL5+XRjMaRbjS
         frxX0jANd7CbovBzeVGqnsYBKawF3XSmffyqwcYEgzwn33SFZzOBN0hfrQb+KnAwff/L
         IX4cz8brt4EF08NWzd/KN94cIhwxIaBnuQlDBvVgkUdOuwgCfXH7k/1RkYx/iBjeFlDO
         OFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787504241; x=1788109041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syT7GQtDMHPLcTTAdV7OL+T3aNWROaJmphq5EZ8nhH0=;
        b=aBRPjV0dJY6VZY/IoYKwSZjUFCjl7ViIG7jtCQCsdeVdJ5EdxprEms+d6bxZdf2Epj
         GEcPQZc0dIkWUsRkAmt5APegClzZcRJv6aLx3PLKvQZFUTfuZ0cgOgHnbC1V06Y6EptK
         LB04Q01YoZHPWvwcqM09rNIuw1M29z1o0dH36NDhQo/uO8i7uOtKX5pnNiGNBmWDYvmp
         bJp5wvGzo2sLsBgde55fIsR5Vl2kLMLFVO2qgUAur8AFbNjcyIfnxzSukeKBqWTtVgST
         IkNpIwWrzPC+PpEZSa1/rrI/OGyONRZuU4CQTUZVTo0WC0/VXuJffcC/9jCLWkSpedm7
         U3DA==
X-Forwarded-Encrypted: i=1; AHgh+RpEBYa+0TMOJyYpkLDO0ve9pGVbH9hMNGnSgyxiPKyHXLOgRZ0Av1LL9X6SdkXyhp3Lac+4EdDz8/Vu@lists.linux.dev
X-Gm-Message-State: AFuF++k34mibjqTDCiZnoqzXuF+4VNObLPJ0//u2vGQzEY1Z0RLJfUcL
	6e1fexFup40G1jFRQpbEjqrwijYXdONdY1qrCenc3Hg0bmI+mNM99yJ7l1ovna+yWKQ=
X-Gm-Gg: AR+sD112mTufoBu3HGtFP9eQ87B2NKyqdOt2iM5TnHLdqOYkgtisSt2xpmxGYkxff8R
	aSau0a703MJWt3V+AAuBkc9YwR4JJhBywMkNdBRtjNjQaCe70EUB/LZ84nuYslbeSvhg65nakl/
	9lOKk+E0aDyqzfnNYjQ+TcbKe6P1e/GxpLqrehcsi6bCfTwdopYa47Qomn8+nbUoQ7yJFEnw3yh
	emprlb9EDwvCnJFdlhZxuO1MlkakVdM7nMwRc7gwSYrCqwUnJ8WNZdCOA4lxSvjT4dP/ROlOyrM
	44tBDTI5Uie3S8WdvocMj8790iKyr2G+MmVTMXGtKsgFRcmJJPfBQ9UfGNkNaAM6mNnCCd+JcK4
	JUuwfRjJtYDGpzXUaY7VOsyonP7KMCHjHt6mOScpZysb1zt4rtfGqBDeS8FhpV2b4vV5pqtfkb6
	/oEMDHwkWkrgADRWooFH0y60Pgc74urWu3LUXvPScL5pyTUwFY9rFJmDzaZ1KkYTQqvXXf+/4Bv
	8WKliFKOCZeet4yVpL3pcyOIEQB2Da2CW+eOYZPsDMN
X-Received: by 2002:a05:620a:4142:b0:932:dbf6:6f9 with SMTP id af79cd13be357-9373942e4f9mr1755655485a.9.1787504241119;
        Sun, 23 Aug 2026 09:57:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749ea4cb8sm328642485a.41.2026.08.23.09.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 09:57:20 -0700 (PDT)
Date: Sun, 23 Aug 2026 12:57:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, 
	Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ira Weiny <iweiny@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Haren Myneni <haren@linux.ibm.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Gabriel Whigham <gabewhigham@gmail.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>, "venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Subject: Re: [PATCH v13 10/12] famfs: Add runtime operation-permission (opts)
 framework
Message-ID: <aoslrrY7CrpmUc3E@gourry-fedora-PF4VCD3F>
References: <0100019fed5850ec-2bdfb17a-3086-44ea-8fdd-777d3ce12a33-000000@email.amazonses.com>
 <20260810202539.96378-1-john@jagalactic.com>
 <0100019fed5a5210-a09f1bdb-c705-44fc-8108-a7e7995a7af0-000000@email.amazonses.com>
 <20260822000728.GB6047@frogsfrogsfrogs>
 <aokdSo9li0RtEt35@gourry-fedora-PF4VCD3F>
 <20260822174029.GC6110@frogsfrogsfrogs>
 <aosejKmNJxCIpQho@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aosejKmNJxCIpQho@gourry-fedora-PF4VCD3F>

On Sun, Aug 23, 2026 at 12:43:14PM -0400, Gregory Price wrote:
> On Sat, Aug 22, 2026 at 10:40:29AM -0700, Darrick J. Wong wrote:
> > 
> > A bigger question I just thought of is sharing cxlmem between files (aka
> > reflink).  Is that allowed?  I could see a theoretical usecase for
> > programs A and B wanting to share some cxlmem for communication or
> > heartbeats whilst having their own /a and /b files for their private
> > memory.  Probably you'd just create a /common file to do that and not
> > map the same cxlmem page into /a and /b, right?
> > 
> 
> Anyway, there's "allowed" and "useful".  You could technically do it
> (maybe not with FAMFS' current guard rails) - but it would be useless
> unless Process A and Process B were in the same coherence domain.
> 

One point of clarification - useless for both processes to write to the
same file concurrently, hence the need for a producer-consumer design as
John suggests.  And even then the software needs to handle coherence
and cacheline write ordering (which is also not guaranteed across
coherence domains by any current specification I know of).

~Gregory
