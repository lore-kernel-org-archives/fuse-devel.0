Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4C3812DD
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376658; cv=none; b=gVgWWligclknnFzg0/3m9Uj1h5aXBuQkl0+Ha0O5ryE2SODv/nJmHooBwO/452uMOWIc0wjuN5Ubk/pz7f8a6nZPCrSSCosiTCVo3KapX7KDL1e2IiRqybloR22T++NLa9gOpmOVO99v3faf0zxIiXIEaSIVs5B3u/gwXydKxjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376658; c=relaxed/simple;
	bh=D+2EqPDkxiIP7659jXJBe6+HwYhGEbOa5dHouxpNOHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evX1FN4n7eKPeNExAp3uil9fE3trU7FtsiLEPDUEk/ONPXsC4H4SRWX6qfWe7QigO1+gbV5hZfZzmT7Uc7CpBNw5qTh0W9ITfox546dRgCmL1xdurphoUBLlKsLIzcLY0xhM8Fz8KZ5ngiK3WBfrdnyS9GtzfbvgQkwW/avk3RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx3aWS2E; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx3aWS2E"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-463f1165e16so2243916f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 01:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376656; x=1782981456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J1jnzmQVNhnRjMNcripM0zyo9VQmhoRd3tOhETxEs8=;
        b=Wx3aWS2EktEeexXpBA2fux1CDIZln/YtHJ2uCgtdeuQokKD1U6+KoVPwk9GRNeQge+
         3G0BivxrMQsYYGaxCh/ZbEcgz3Oy0yQueXATSzOcx1GKgfACTFgd8bVYojexzH0APwxH
         WjHz28QvtMz9f9sFoBKpC/3VIIIh+NyueYwaJotV6WyIiVcBVh7fqm9JU8AH5DfNEX6N
         m6iMhfytzr3OBl/GgOG6u1YGLqeOgfofAM+81OfUmVru34r4cnPKM7eL9jge2UPlviIz
         vU7A9FQ20I5IUGc8OdQpmm+RMGHGPHWH4bKc49xa+/DU3XuuiEdW11Y1fR7nQR7pCNfT
         zRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376656; x=1782981456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0J1jnzmQVNhnRjMNcripM0zyo9VQmhoRd3tOhETxEs8=;
        b=kVzP80I6tE4jVB1OqX+y9/TX8Aca733XjLPbQlWSr/NRViOv+TnmIyYSO5C8CboB2c
         NFALnvc+/E56fAsCYJGqK/8rKoYtPJd8DA/vOtyIwgTL05nj0VOzu/SVhHvyobHkGR8I
         I735amMrrAasAD6g0DicCnkXT4dsmfYhc2G6uIT6eRBK1QQQkeayi70iZc9IsH72Miz1
         0rfrd7a0miCxHhawJNTEeM3OOrpo818do2b37dgC015IgSllJ5WjgqgePZKuR4NipWmT
         qrzshTmFmMrfGDOomQQJrenk7k0EOnFs6WdlEr+ErV/xQCOgLITFUSBnzgEGc7XeAYXd
         u4Zg==
X-Forwarded-Encrypted: i=1; AHgh+RqQzIKqP5gYM7RFEcKfSKQMFjXjntyLwvudC8W3gMUw3oYiBwA6xmOw6KZgtpyc0v8zF9kE0dvYEHgB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx50yIO5vGG9rfdyKojtdj6nY/GBu+5SAb10LvydjTLYBuX74GU
	BiaSlRhEi4CA2SKprINcKGFzjxX4rGpnjs0ybw4XdxoorBnCaZLFDAN3
X-Gm-Gg: AfdE7clNXpvzeuo2n1Ctg9ez5PKCp6GRLLZTdtNRHgLNQFVNzjkLaMiS+e7AnlOST8+
	TQ4D+exljZteDdGv5vdZSDTaaZ8fOLHqENy4Pr9IVWJ8RyMGY8YNmenPvaIokJSUkj/m73hNlyO
	y8CK1cb5cQIwdKOgWucgeGM9MmtKyLK4rSZ7wG0G9IwPk6JLtI+wAQ7vdCJlfDbrnat2bbG/Ty/
	WiZxfihRmQkzFdB8KL9HHdh22DRdfmwFgYNZEypXA0eKFgVlxhvqF9t4IBdPFUbzztBzZF9HJ8o
	81ggXxHWBAEHLCUrUgHus3gyPcqBcKDWNNuPEKNXUoxBYiZ+7TYiQUGkGMi9VkUqNSUeZOPbBdN
	Bk5SMzo5GXtOeEdcFeF4qQtoS/q+2e95tQAauDXmf3bXXlmd+akN+galUsIikjsgzRz/gCQX+M5
	ejA8uY0JxZ/Dou5LDsYjg=
X-Received: by 2002:a05:6000:2485:b0:46c:a463:987b with SMTP id ffacd0b85a97d-46dc1e82faamr2365468f8f.41.1782376655597;
        Thu, 25 Jun 2026 01:37:35 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46c9ed7491esm9943798f8f.37.2026.06.25.01.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:37:35 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-api@vger.kernel.org,
	netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andy Lutomirski <luto@amacapital.net>,
	Collin Funk <collin.funk1@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Stefan Metzmacher <metze@samba.org>,
	The 8472 <kernel@infinite-source.de>,
	Willy Tarreau <w@1wt.eu>,
	Joanne Koong <joannelkoong@gmail.com>,
	Val Packett <val@packett.cool>,
	Andrei Vagin <avagin@gmail.com>,
	patches@lists.linux.dev
Subject: [PATCH v2 7/7] pipe: set FMODE_NOWAIT for named FIFOs
Date: Thu, 25 Jun 2026 08:34:09 +0000
Message-ID: <20260625083409.3769242-8-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625083409.3769242-1-safinaskar@gmail.com>
References: <20260625083409.3769242-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CRIU relies on ability to do vmsplice(SPLICE_F_NONBLOCK) on named FIFOs.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/pipe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/pipe.c b/fs/pipe.c
index c0ccf21b9..a8e9b4459 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -1156,6 +1156,12 @@ static int fifo_open(struct inode *inode, struct file *filp)
 	/* We can only do regular read/write on fifos */
 	stream_open(inode, filp);
 
+	/*
+	 * CRIU relies on ability to do vmsplice(SPLICE_F_NONBLOCK)
+	 * on named FIFOs.
+	 */
+	filp->f_mode |= FMODE_NOWAIT;
+
 	switch (filp->f_mode & (FMODE_READ | FMODE_WRITE)) {
 	case FMODE_READ:
 	/*
-- 
2.47.3

