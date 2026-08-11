Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F7421A17
	for <fuse-devel@lists.linux.dev>; Tue, 11 Aug 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438805; cv=pass; b=jCU8v7DHWuG6Gh5f+a0tKeqBvr4k2BFH/BvDHTzZsXz0vaA2wnmQZHOpLp1iFr2GpIcZxZcGLGha/NojtWOfAZIJbOEHVw83nlYQq6/II2ghddErjKXuWU0XX3CwhT5R51pjSr2IOOeidoU9rvOwg1ovg4bsU93nP6dqfs126sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438805; c=relaxed/simple;
	bh=QAVJs6W1FBqjbAOF/0emhNqG9jbCkXvsyG1EUwOkxnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaB5+zbyqsklKGnj5ksl67Xx3pE2kHPzB7wiQ6mOAQdT86NsQifzJUhRRDmFiveZqPtRRWYRpw9UEoYeOCwx3ttFVmPGIuuLHazBlqsydrVEADFtGUSlExp87UfCtkAp2cVa4noEbBm+FQBr4UrElnsRhBWhI0vrPP38sEhXS0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=PlcPOvba; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="PlcPOvba"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-934944f2d22so30506785a.0
        for <fuse-devel@lists.linux.dev>; Tue, 11 Aug 2026 02:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786438802; cv=none;
        d=google.com; s=arc-20260327;
        b=k81txnF3ohQMO/nVOADRK9gdOwk4FNkPKlDQukEy+tDF8qGEeqgqws2NCelFlLcZNP
         LjQO3Eln5PWrjbsoZ2l9ekzzXRjycOrlZUXpOfwjHmhtTv8CZLgc7NAFf2vBcdBbu4p7
         +K65zFXBIuRHziJ2p02Eet+AlsRrMWvILQiDwATxWP9G/LNt6faqL7ipdgS5j3NjDEwq
         Hdwf66DjPwUR8CKhyG2uQGsThEfbA1M6fIlGKQiOBFeB9akfc2rJ/n5sPNJCzk9GrzWh
         6v50nKe8OeXJxsXyFh+HWcfUlLhFDR8TXPzxdD/byu5fnRK1THRDtfL0x9fXGu5rqEj4
         PDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=03hUfqpAtMk8895qbCCQElojWBhsj8Ov0HHep5mUb5Q=;
        fh=m6S4/5snos8JBnDQ7B0CZ5U4QKYxTDp6BIjSYSpGeUA=;
        b=f6ypM0kaSUlREfemOXqKk5Usly+xCMO8b1ujqhq8xBCqQYy4iprUBls4eRAkH8/R5+
         rCDKciJUkB30sy3xHHvm5Jt8OLWxHd6KfQ73lpiuMizTCVTfC1N1xcwrD2SM9cLAew2X
         7JvXqKQ+v/oVkRRN66MosHcDZX1jm77PMSE7K+cxHfGmZan8gYpn0jmumJaFjYEnDmMK
         Wigkwm1ucZnI+R3vqyn5AsNKUy08qST0aigMH2KfXEocl+3mFBWZBT5EtrVOZ3j9oGtP
         W+IxxDpBLLjE63/AH8DjigtY3xtDGUYHQ4FSop/cQQMjn82DQ/J4++0KjaOSGPFRIzVp
         rBKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1786438802; x=1787043602; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03hUfqpAtMk8895qbCCQElojWBhsj8Ov0HHep5mUb5Q=;
        b=PlcPOvbaXTEeT7hTdfgIs87oQkW5phE+M08k9qJa7fXs/ahc4ky0kjf8kum2+vuhrc
         4fLlg+do0lRbW8mVFBwcQE7SlO9V9NOChhpHfLjT2EbjQgv3rhiSfZiN/5yIEL/hgeah
         Y322zeOUwhXKs3AFswmOcvzDeKINP0QeKfgsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438802; x=1787043602;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=03hUfqpAtMk8895qbCCQElojWBhsj8Ov0HHep5mUb5Q=;
        b=esM+1pGycFIO1UklvLpmnQn0PvFquTLDMX7V7MRQVNEDD2LAZ+OW1AqwQqqkCjwNTA
         l2b6HD/3JVen36FfM0+V/in/cObF5XZ7vjfqxCSV9OH1YIWc/CVwkfks2PqhHbc6hiVb
         LzAvwRqvLstDHhwqjyDRgkb7XMnv/kiq54W7+Amz2+jCfbK2eh1tyJhxkIqpCVuc/lVF
         Ew8i1rgy3/Vqiwzh8tMF2VD2KuvSKEzDA/FvEwxTsm9Iot5aUmAqop7XrPYaI02c/Fk3
         PrAV2Br4vlyJVn9fLYq6L1MQBDJcy5xfK5mVDY1v3S5VpUJkkjv4i1voJcWwuMp9AwaX
         tDcg==
X-Forwarded-Encrypted: i=1; AHgh+RqF8f870TQZhIfoFJKp/QpT4/LPwVvhEmLsomI2kmckukOe7Dw5dT8zTSvv5P8WZMVUJ4v5Ko1gqL+A@lists.linux.dev
X-Gm-Message-State: AOJu0YxcUS3+0Pw4f9nDbG7EEGJlCVNC9JuwqxgGNVugCxgTtyaVcXmt
	PypLCnkP3OyRJe27Pb3hqBJb2B5ZuptWgOpPPrbms2IN6RGgyNZ7iBeF/Q7ZeWCJx2nYIP9+8JD
	pAN2FjkoBAMSP1qk2v7XfXJH19g3XI+steFRiMgylNQ==
X-Gm-Gg: AR+sD10TbM7sODhTkrGIMuMee+h1zCtwX9Z+vLNAGJUFHNT4nndDopWvbJz1jkI3rjL
	xTUQ8KPe0tvlg1kSqhRUS2ZPgIus5AqepsdLqcCuNRTmY6L9PGPS9PX3UdYWvObIy4bncryXkN8
	66n6xW+uerEByhM//jQv6Rg9/pDMmzMyVr7OtDzgv0e+WQ9h/GEULPRA7yvu96ARSYf2JO8kTpn
	Sg3Ap2N5v+7zWFCcccEOwZ/+LJb2GKPO4lrp+B6RoBo3chxv5gWuYV6yVAl8wp98tpQXuFzFxUD
	2RATSA5NOE77xQLFb/GOQc+Mf8P+4nDnAp0IaCTIyoE92RwCYVDQj53WiHMNmEeRBR/GL9Hnexf
	80MyzS1btmQ==
X-Received: by 2002:a05:620a:26a9:b0:930:9774:868e with SMTP id
 af79cd13be357-936a8e70eb3mr130606285a.7.1786438801859; Tue, 11 Aug 2026
 02:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0100019fc572ca94-ec363dd7-3a77-484b-b4b7-f2503a0931a6-000000@email.amazonses.com>
 <20260803022828.75776-1-john@jagalactic.com> <0100019fc5739e5d-bc002300-eede-4c40-9ca8-a277b754496e-000000@email.amazonses.com>
 <20260806043712.GB3560084@frogsfrogsfrogs>
In-Reply-To: <20260806043712.GB3560084@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 11 Aug 2026 10:59:50 +0200
X-Gm-Features: AUfX_mzPBN-WtEK90PQcEbgkE1jczoRAdcaPSoPUxrlnLvA164kB5DWNAs636Zo
Message-ID: <CAJfpegtW4bFn=oNfTipCxhiExaqSXnhXeBd6Uq15FpepqCJaPQ@mail.gmail.com>
Subject: Re: [PATCH V12 02/12] famfs: Module operations, fs_context, and mount
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, 
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
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ira Weiny <iweiny@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Haren Myneni <haren@linux.ibm.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Gabriel Whigham <gabewhigham@gmail.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 06:37, Darrick J. Wong <djwong@kernel.org> wrote:

> IOWs, let's fix the remaining wobbles (if any) and just merge this
> already.  No more side quests through gigantic refactorings of fusex,
> that's too much to ask after you already redesigned and reimplemented
> the whole thing already.

Without any intention to change the direction, let me just state some facts:

 - it was never suggested that famfs depend on the fusex work in any way

 - the plan to add famfs mappings to fuse was laid out two and a half
years ago in reply to the very first rfc posting and has basically
remained unchanged since then:

https://lore.kernel.org/all/CAJfpegv8XzFvty_x00UehUQxw9ai8BytvGNXE8SL03zfsTN6ag@mail.gmail.com/

I understand how that seemingly simple API addition was overwhelming
for John, and I should have been more proactive in helping with the
implementation.  That's entirely my fault.

On the other hand John could have been more trusting that the plan will work.

But that's behind us now, let's move on...

Thanks,
Miklos
