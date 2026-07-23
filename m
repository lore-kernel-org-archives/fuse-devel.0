Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF223D301E
	for <fuse-devel@lists.linux.dev>; Thu, 23 Jul 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789754; cv=pass; b=QUMhRbJ6tNwQ2vA8pteX717KYkN9QH+Et+h1Uw5OnK3EHjLGG3VCco08DXlVnRjnYSkgPl2bdev3uxaJwfaDM6ZahH7PdlPTcB2LernA85qjaViVzCEZZD03tJrsRcBkMTVpHEVhfuMP2/2dU6p/LL/OztohH2E+azGGpjInows=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789754; c=relaxed/simple;
	bh=7xavlvPgaj2aZOYRfaOcUw2KPrv2zI3pLKx85cjIG00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exs1vR7fLrGKny8V+D8QLLtDaLagfIiP+XyeWjBu4eLPNketY8E1qeEKtxccoHDlUhaqbMYvCthN9TVjtSl/ZULQmLKAVKMHrSW41RTC4dhExqsXsBJMITiV69+/v/4hR5XGEGbbKkWxwpS7dcXNdbSjjar4oqG0QMAupCwy2v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=PoIyG7OY; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="PoIyG7OY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c0c68aa31so2349191cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 23:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784789751; cv=none;
        d=google.com; s=arc-20260327;
        b=nvJbZtbBUDLyt/RH8JlhQYaft25DliS0tXEwOffL5muQqIED0aw2AgyRI3Gt2J0bCY
         dAN6Ae/FWJ3ROr6LNnyva9EEMybGN/7CPTki3miuAsYtSqF4d3PlVPcx2ffnd0lbjo6V
         AnElt+Yt5U3K714A8l0IrPOY69IqKGnVA1OEyk5c3dXgmUgglw2kRklmAU1c+C8S6v+H
         cDNp52HObJmxRpQbS52nFfv6h9Ci6orpc9lBTENuur8asU3I7923sKFkGwjRTDhmsRl6
         nLpEn/4dWJoyBumSaMUGAinDKc62t04KdP2umaU+GkernAn85tw3H5ntFN/t5wnizDc9
         ZG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/L/US/G+XEKajQPS4lkAeBu5twJB/EgGo9GV13H6UZU=;
        fh=EDIAePC/v5kytyM8ukiqpsABPJBO4YyYg690UIELbRY=;
        b=EaoneTqc2Hcf2M+pax83V9l/OinB0jW7R54NZayPuy5ye+SimzVxk8z0Qg/BuXHhT9
         IE26/xHHliSgeO3bf5GHganmaGYZZmqq5JfNTLlF5sVNR+JEkFUEhMSyV2+idXV/xY1/
         I/yC3V3e8vmzNp8jjYKevBtpTo3nM/bKG/Ai82Wwf0t3SLF/0Qn5KMsxGVL9omXqQTuH
         ctwdpn/qowQ9rOYU4CkODJN0/oKXsLIt45Kaj+rgFguIiDP6Y4PZaana7a7nb8xq49/8
         suwdSeG4jTDY+xkvLfGlu6BuBfNvQjwJeGEHzkco77SC/y8oz0rY+YWL4DqWSjKCF69L
         ZYQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784789751; x=1785394551; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L/US/G+XEKajQPS4lkAeBu5twJB/EgGo9GV13H6UZU=;
        b=PoIyG7OYhZce/eZZ+2XDuwTc2RsaKgK+8HJpt+tjp18Q11dRa1hb+stO+AX4FGMnc3
         v4JnLdnKhpKgnwiEepO4d0vSZ60v1ITKUdrZbwdgrKJzMRQQEOwYMVK5FH/hcry7T0JA
         IIbWS6nU3INYmDJZGrQxr8Y8/pP6eewCO3z3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784789751; x=1785394551;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/L/US/G+XEKajQPS4lkAeBu5twJB/EgGo9GV13H6UZU=;
        b=Xxp2W/7DP0BEfZo15J/DB7JRcYaDaqgbnfLdK3NRVgW3cp+XVWdzVSRxMS8S0tqKYT
         KUd3Zsu+S+g2BJtGRIUaDh4cjYMFqX7qyK6mfyOSni2yqZ68BBQGq7CUUyKQqVE5RTy5
         nURBZzoWyomoibA+DWriyf0tzpnPR9YL0cyWj8UTnqpdFaNJL4PKVncMnvlBf0B0n1uv
         fYgeABnkqduLypljQwL3OH+bRac1lBq3qnBOroNa8Szby34wuq1QxXXGOHs9SvAUR88+
         UuU+LNaUfedQC6+w8rCLp1i0YB9zqsMNINYtlTd5LV//GABsJDDIJWcPb8KDJn/UEtXH
         cY1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKyphsp9UJVatfKgv4gRGp+U/RYjGQZ5pOH8z5YqvFU33RhWaccFMvOViZT94R4784Zmb8Q5ugIBf+@lists.linux.dev
X-Gm-Message-State: AOJu0YxZK//ZAVCmUPEdiAlX/PiSmtRJdrfEXEoqOIGAsIqM9B1qfAZZ
	oN8ZwxNQjK77E1GX7WboOnmBiUMZxjZU8RFE+wY3RTNFWBN5o+k2Q/AqxVMOoGJvV7SABxM9UCS
	hSz97yePWRQ62PA0T464zX0vEZ1oqbxkPcSmjH79OJA==
X-Gm-Gg: AR+sD11cGvFyg8MF71VcD2zrVkkh4Pu1cWclPNgn/oMRVH6TEq6yTyN1zHof2zahwyp
	slNKrbWosEZkKBPY+vfAi6lyqy9p2nyx/NzlmLxm8KoiN74UMxK3LbYSo8yIqFKGEtwzoachNHZ
	5QCLU4oWiclw2D/b3fH+phlkf14mO84OV4n2YccgFREmylytBJ0LFGGNL8jJKgZoCkRFcTuP3Uc
	1AZ9IzpOBcXBgLFlwKCb3CoLuek9iEi3BxDXR76mK86vKT9/ru4mzOG9yJ0rTrfKWlI702pd0CQ
	rLtYDTdtxHFEFcjIYzcUQnH1cOfgbBo8o7sFEuQ=
X-Received: by 2002:a05:622a:2cd:b0:51c:7b12:5ff4 with SMTP id
 d75a77b69052e-5283dfea04bmr15949681cf.80.1784789750870; Wed, 22 Jul 2026
 23:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com> <amFMUtTB4SmHdYZx@groves.net>
In-Reply-To: <amFMUtTB4SmHdYZx@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 23 Jul 2026 08:55:39 +0200
X-Gm-Features: AUfX_mwm61XvzbEAWjZX7-oCx0aIcunUf-H5-PKtYcEgLU4ucKjhPy9XCcc8KUQ
Message-ID: <CAJfpegs81UPgqh3XsvAAE6PfDOiPcMceLZD7p9SRR+HaVZbgTg@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: John Groves <John@groves.net>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <john@jagalactic.com>, 
	Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jul 2026 at 02:32, John Groves <John@groves.net> wrote:

> I will make this high-level comment: After reading Amir's initial reply, I
> concluded that the requested changes push famfs past the breaking point,
> and therefore the only way to keep famfs suitable for its intended usage is
> to pivot back to standalone. I do think that may be best all-around for fuse,
> famfs and Linux. I don't see any way famfs makes fuse better - it's a very
> specialized pattern that doesn't fit in a passthrough-filesystem or
> block-filesystem shaped hole. And I don't think it can comply with the
> "nothing famfs-specific in GET_FMAP" objective.

I can say with confidence that there is nothing famfs specific in
GET_FMAP that is actually being used.  There are some unused and
redundant fields in your struct that can be removed now, and we can
leave space for future extension in the extent format.  Adding code
for unused features makes little to no sense but can add significant
burden.  Allowing extensibility instead should be a much better
choice.

As Joanne mentioned, adding extent mapping to fuse would be a
generically useful feature.  It's been on my mental todo list for
10-15 years.  Sure, we can do that without famfs, so...

> If famfs is standalone, it can only ever affect customers who use it, and it
> cannot be used as a general purpose file system. When famfs is in fuse, it's
> mashed up with code for hundreds or thousands of other use cases. That's not
> a win from a risk management standpoint, and it doesn't make famfs better -
> certainly not in any way that would mitigate adding a lot of state /
> complexity / baggage to famfs.

The risk of standalone is abandonment.  That's a call for the VFS
maintainers, I'm not going to stand in the way.

Thanks,
Miklos
