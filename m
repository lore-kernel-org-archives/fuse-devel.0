Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A313F3932D1
	for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733865; cv=pass; b=I1sSI8Df53r5SyANiDzcgJ4IDh8eE/imSwRWBEDgZV/WQy7CfGElOU4Cdbu+3G1F/Q1FE0ZJeC/h7vx9b5hhqsk802BgwM5mmm5b5FMXtw1uApGs9LJvYD75AbnkcIiuW/plWBlsGPBoRjolZWWdjSnrmw+qnc6Lw7lwvT/5Eo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733865; c=relaxed/simple;
	bh=FmqQi9tHDOGtMRA8eYccGrCqdDwhdIqG1ghsXPY1Uts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdKoGt7Fv/bzpXFIGQFYghS45GWYvQhzP9aVgS1HAImxWZPshLhRqUfvRewWknkSEqbKE9l8o7t71RNVqr21GuMni/2UfyyRjW9Lu1B+K8rpbge61UTaXg5fjEC/gzIqeWnYiqAt65y8ETdsqtNX29Em2uKI+REeIYmorVoD/SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=lZub4YDw; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="lZub4YDw"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e7c6ec9dbso690646885a.0
        for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 08:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784733856; cv=none;
        d=google.com; s=arc-20260327;
        b=MnAaGeWf4FilGw4ZxlHto/D1oS0Rhk33JMNmL9wRffEqe9Xeg4iXSdlVJprsYllpCN
         0q7gplbqWv8thSnUTzfhAzrmtC2COYm4Q3hWiMvD1tTfnwW85UCdMoU3TGaPNpKpoq9F
         Z/3DF+VigJwgdM7FLgBhAxZA9GaIbmVMjQuYMMS8384VdaaYu8+663vQe+FWUY0HtSUQ
         0EcXYSeErxee8lgmOt1EzYztdxzxiZtH94ijfzKCyMCMJsuRnp0bAoqEAaXXkkvaCDYc
         q11f/yTS7TAlPcHXxzuKS4ooTQGyGVc3NjFhOsgJ4BOeB/eSZZ1SF+I+9fnrOuypzCHk
         PRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ff8+sJsygEDuStaVFp2hCNrsI9M5jePRaYSdvrv4X0o=;
        fh=Vd4gDjUJhJuyLpvXhXxlFzgCEgaj9sGbTfmWuhl+oqY=;
        b=oeiWxGqx/BK98FN0QjFrA7rwxzrnPUzzM950bHl1PX55OkIWONCcqZFdSeRDhqWYg3
         b8t1sEIBUCxyl5+fsx8vdwqvi/Y3YDy7QRjucAw30zvBRDInww2sxSHPQ+4/nuBJe6fR
         j+P3gPYHPYLHaSO01GCf53E3RL1Y/wEpOBshMJMy6J1aUUuWdtPXAPiCbsqbLV23fEWJ
         Ru2F2nnQgHGYui1Q5GjTpZJyWYBAT3rWvlS8ecre1MA+YmfY8fGtKI536m28WJHVaq1l
         upyVnQFc16HhQYCUprj9/yaX7kE9D7/MDyG503pV4i2O3Z1ibBT1qifZ0bg7GZ4IUo6k
         HxMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784733856; x=1785338656; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ff8+sJsygEDuStaVFp2hCNrsI9M5jePRaYSdvrv4X0o=;
        b=lZub4YDwgHtq/qw3NACjxGrTTKi/1BxBqrfHlTLq7DlD2Qyp3D9SgeRsw3vNyxlCkn
         /HbCvHuLP8ox/U2nBc7dzX7xEv93MuYDbtK9YR453xk6VKa2W4pzfk7em+y8K/Wr1KDB
         EcymrYeIfk6j3OticzPUhcsLl06mighdpSe/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733856; x=1785338656;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ff8+sJsygEDuStaVFp2hCNrsI9M5jePRaYSdvrv4X0o=;
        b=VQeNK68/habSZv63GM0umskp7z0V6PIQVVMo03fEjqAwQfn3J7oCoROEnbdle/Both
         NUVT/ycFPfxdm7cS9QJBzofJGlZpcN/+l0Lr+6hPO38apLWPPMnGXPG0q+avC1zS69CM
         Y7qSLpjsn2TaBu8nFjfu14nkZTsaSQckPYhyqQZqdqfmvAjQFMfJdxsxIdtgW8fcOGNP
         bJwk99V0Lsy0ZlxRT6dunojy3OGjr7v971N5gyNIE8XFG4Nh6AY8EBLu+WullqVuyaS9
         d4NdVnFpy6IUxjxuzTKe+KgGIMsnws9mAJomloq1ev5ZF3BG4hnWuHmrNvsdmf/MIG6k
         D0iw==
X-Forwarded-Encrypted: i=1; AHgh+RpwXHQgR4HPqXxnXKmDzAMbGEYwPZG/pHo2NpsYVX3CCpxW2ohhvfOfDAtQQE4Hj6R6/uBBJmXKtJXe@lists.linux.dev
X-Gm-Message-State: AOJu0YyUViVjNqT/zT1C8oaLAKb7oSme7i8nK3MQD++N1oIm9wWht3KA
	EtHuUmEU1Y4ydyiXupYlPos/IM7mk4urvNsZuXPCHrQ5dRDrRCEM4nj441Y5mX9WjInZDc1j8A+
	11PS455thWNtj3sgPuhJfVOsYSLFXXMg8FzOQpCiqSQ==
X-Gm-Gg: AR+sD11yZKWExaRs5iyefWR62BbafRGFZtTT0RnTyS4GdfQxjrvew+mfelSUJg0FFFp
	b9KmvMFS1nyCqmUWTY0uCg9n5RulTulXUCxS0OjuTEfglqZxC4ajqmNhllK0awnpJ/AltQpc9l+
	MhxCzDzAPfaSyMHw0xGW7BhDIpqulS/N61dJI3at5v/l7AMOg/czy5kbJ1MOK0JESDe3QTzqUpj
	v9gwnIwvo+JAyuKtxjG5B0r1yE0HB3olbpx7/hD+nkjkNZ5XncoP5DMqvKsuoPtyo15gXEaLVJ/
	pfH7LmHiErAxUzTaYw==
X-Received: by 2002:a05:620a:2844:b0:92e:9cb3:3f71 with SMTP id
 af79cd13be357-930b3ed66f6mr2281752885a.36.1784733856139; Wed, 22 Jul 2026
 08:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034553.68798-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <0100019f7da174eb-4cd0f3ae-59da-4533-b469-6eee009a22bd-000000@email.amazonses.com>
In-Reply-To: <0100019f7da174eb-4cd0f3ae-59da-4533-b469-6eee009a22bd-000000@email.amazonses.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 Jul 2026 17:24:05 +0200
X-Gm-Features: AUfX_mxUSuw0ZWzZWiq2Rpl7efuyYxiFK3IBC4AQjtyaBV6Cq7Rj41foWBlGbSE
Message-ID: <CAJfpegvkbK4xtQsssn3yrdLn7zZRGB8MeRcauP8mbmJRCnFouw@mail.gmail.com>
Subject: Re: [PATCH V11 4/9] famfs_fuse: Create files with famfs fmaps
To: John Groves <john@jagalactic.com>
Cc: John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
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

On Mon, 20 Jul 2026 at 05:46, John Groves <john@jagalactic.com> wrote:

> +/* Famfs fmap message components */
> +
> +#define FAMFS_FMAP_VERSION 1

Please don't use separate versioning for extents.  It doesn't help
with feature negotiation, so let's just use the INIT feature flags for
this purpose.

> +
> +#define FAMFS_FMAP_MAX 32768 /* Largest supported fmap message */

Not sure if it makes sense declaring this on the user API.

> +
> +enum fuse_famfs_file_type {
> +       FUSE_FAMFS_FILE_REG,
> +       FUSE_FAMFS_FILE_SUPERBLOCK,
> +       FUSE_FAMFS_FILE_LOG,
> +};

Unused, apparently.

> +
> +enum famfs_ext_type {
> +       FUSE_FAMFS_EXT_SIMPLE = 0,
> +};

An enum with a single value is not useful.

> +
> +struct fuse_famfs_simple_ext {

struct fuse_extent {

> +       uint32_t se_devindex;

uint64_t backing_id.

> +       uint32_t reserved;
> +       uint64_t se_offset;
> +       uint64_t se_len;

Please  drop the "se_" prefix.

Please add more spare space here (e.g. uint64_t space[3]).

> +};

> +
> +struct fuse_famfs_fmap_header {

struct fuse_extents_header {

> +       uint8_t file_type; /* enum fuse_famfs_file_type */

Unused

> +       uint8_t reserved;
> +       uint16_t fmap_version;

Don't use, plese.

> +       uint32_t ext_type; /* enum famfs_ext_type */

Unused.

> +       uint32_t nextents;

Okay.

> +       uint32_t fmap_size; /* Inclusive of this header */

That's the same as outh.len.

> +       uint64_t file_size;

Same as i_size

Thanks,
Miklos
